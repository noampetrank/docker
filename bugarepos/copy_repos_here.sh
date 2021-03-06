#!/bin/sh

rm -rf Bugatone-Space
mkdir -p Bugatone-Space/lib/linux_x86
mkdir -p Bugatone-Space/parameters/operational/
cp /home/buga/Bugatone-Space/lib/linux_x86/libbugatone_algo_c.so Bugatone-Space/lib/linux_x86/
cp /home/buga/Bugatone-Space/lib/linux_x86/libbugatone_algo.so Bugatone-Space/lib/linux_x86/
cp /home/buga/Bugatone-Space/lib/linux_x86/libbugatone_common.so Bugatone-Space/lib/linux_x86/
cp -r /usr/lib/x86_64-linux-gnu/libfftw3_omp.so.3.5.7 Bugatone-Space/lib/linux_x86/
cp -r /usr/lib/x86_64-linux-gnu/libfftw3_omp.so.3 Bugatone-Space/lib/linux_x86/
cp /usr/lib/x86_64-linux-gnu/libfftw3q.so.3 Bugatone-Space/lib/linux_x86/
cp /usr/lib/x86_64-linux-gnu/libfftw3q_omp.so.3 Bugatone-Space/lib/linux_x86/
rsync -a /home/buga/Bugatone-Space/python Bugatone-Space/ --exclude="python/notebooks" --exclude="python/projects/webserver" --exclude="python/projects/temperature/resources"
cp /home/buga/Bugatone-Space/setup.py Bugatone-Space/setup.py
cp /home/buga/Bugatone-Space/parameters/operational/audio_params_auto_Pro70789830_11_D1050_2017_02_20_09_21 Bugatone-Space/parameters/operational/
cp /home/buga/Bugatone-Space/parameters/operational/audio_params_auto_Pro70789056_0_D1011_2017_01_02_19_20 Bugatone-Space/parameters/operational/

rm -rf mobileproduct
mkdir -p mobileproduct/lib/linux_x86/Release
rsync -a /home/buga/mobileproduct/lib/linux_x86/Release mobileproduct/lib/linux_x86/ --exclude="*.a"
cp -r /home/buga/mobileproduct/pymobileproduct mobileproduct/
cp /home/buga/mobileproduct/setup.py mobileproduct/setup.py

rm -rf device_communication
mkdir -p device_communication/cpp/lib/linux_x86/Release
rsync -a /home/buga/device_communication/cpp/lib/linux_x86/Release device_communication/cpp/lib/linux_x86/ --exclude="*.a"
cp -r /home/buga/device_communication/pydcomm device_communication/
cp  /home/buga/device_communication/setup.py device_communication/setup.py

rm -rf oppo_daemon
mkdir -p oppo_daemon/all_daemons/2019.0116.01_sgn/
cp /home/buga/oppo_daemon/all_daemons/2019.0116.01_sgn/daemon_flow_single_player.yaml oppo_daemon/all_daemons/2019.0116.01_sgn/daemon_flow_single_player.yaml
cp -r /home/buga/oppo_daemon/device_configurations oppo_daemon/
cp -r /home/buga/oppo_daemon/detection_signals oppo_daemon/