FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get update && \
    apt-get -y install g++ git libcurl4-openssl-dev libasound2-dev \
    python-setuptools build-essential python-dev libfftw3-dev \
    zlib1g-dev libatlas-base-dev libblas-dev \
    liblapack-dev gfortran swig awscli libncurses5-dev libncursesw5 \
    libncursesw5-dev xmlto libffi-dev \
    gcc gfortran python wget python-pip \
    libpng-dev libhdf5-serial-dev libportaudio2 usbutils python-tk

RUN pip install numpy cffi flask cbor requests twisted
RUN pip install tqdm colorama pyserial progressbar pyusb future
RUN pip install autobahn configparser pyalsaaudio boto3 pytest
RUN pip install scipy pyro4 stopit bs4 pygithub matplotlib cowsay pandas
RUN pip install enum34 mock nose nose-exclude parameterized 
RUN pip install timeout-decorator pathlib2 jinja2 tables pynput clipboard
RUN pip install scp typing deprecated subprocess32 humanfriendly netifaces
RUN pip install ipaddress grpcio protobuf ipyparallel
RUN pip install klepto git+https://github.com/Bugatone/pipe.git git+https://github.com/drorspei/sismic.git@python2.7

ENV PYTHONPATH "${PYTHONPATH}:/home/buga/Bugatone-Space/python"
ENV BUGATONE_ROOT=/home/buga/Bugatone-Space

RUN ln -s /root /home/buga && mkdir -p /home/buga/buga_logs \
    && mkdir -p /home/buga/tmp_dir \
    && mkdir -p /home/buga/experiments

ADD ./bugaconfig.ini /root/
