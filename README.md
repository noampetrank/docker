# docker
Repo for Dockerfiles of Bugatone

# bugabase
This is a Docker image for a basic Ubuntu that has everything needed to run* stuff from pybuga and pymobileproduct - but without pybuga and pymobileproduct. This needs to be as compact as possible, since almost all images are going to built on this one. There are probably already some apps that don't really need to be here, and the image is huge.

To build the image use the following from the top of this repo:
```
docker build bugabase --tag=bugabase
```

* The running we're talking about is vanilla python and pre-compiled binaries. This means no graphics, such as Tk, and no compilation, no clang. If you need these, make a new image.

# bugarepos
There's a shell script in this directory that copies *your* local python repos (pybuga, pymobileproduct, pydcomm) and compiled libraries and supporting files (all lib/linux_x86/Release, and files from oppo_daemon). If you run the script and then create the Docker image, then it will contain working python of the three repositories. Pybugarec is not included.

To build the image first run the copy script, and then run docker build:
```
cd bugarepos
./copy_repos_here.sh
cd ..
docker build bugarepos --tag=bugarepos
```

# bugaengine
There's a shell script in this directory that copies *your* local ipyparallel engine json configuration file, from the default profile.

To run the ipcontroller such that it can be connected to, and also generate the engine configuration file for the first time, run:
```
ipcontroller --ip="*" --location=10.0.0.? --reuse
```

All three arguments are important:
* ip="*" - listen on all interfaces
* location - what to put in the engine config file, so that engines from other machines can connect
* reuse - don't generate a new engine config file, so that you don't have to copy it again and generate new images and containers.

To build the image, create the engine config file once, use the script to copy it to the `bugaengine` folder, and use then run docker build:
```
cd bugaengine
./copy_engine_json.sh
cd ..
docker build bugaengine --tag=bugaengine
```

Once built, to run a single engine use:
```
docker run -v /mnt/buga_storage:/mnt/buga_storage --net=host bugaengine
```

# Moving images around
Until we set up our own registry (docker-hub), you can export images to files, copy to other machines, and then load, using the following commands:

```
docker save --output my_saved_image.tar existing_image_tag
```

Copy `my_saved_image.tar` to another machine, and then run there:

```
docker load --input my_saved_image.tar
```

You can then run a container use the `docker run` command on that machine.