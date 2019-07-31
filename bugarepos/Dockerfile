FROM bugabase

RUN mkdir -p /root/Bugatone-Space/parameters/operational && \
    mkdir -p /root/Bugatone-Space/lib/linux_x86 && \
    mkdir -p /root/mobileproduct/lib/linux_x86/Release && \
    mkdir -p /root/device_communication/lib/linux_x86/Release && \
    mkdir -p /root/oppo_daemon/all_daemons/2019.0116.01_sgn/

ADD ./Bugatone-Space/lib/linux_x86 /root/Bugatone-Space/lib/linux_x86
ADD ./Bugatone-Space/python /root/Bugatone-Space/python
ADD ./Bugatone-Space/setup.py /root/Bugatone-Space/setup.py
ADD ./Bugatone-Space/parameters/operational/audio_params_auto_Pro70789830_11_D1050_2017_02_20_09_21 /root/Bugatone-Space/parameters/operational/
ADD ./Bugatone-Space/parameters/operational/audio_params_auto_Pro70789056_0_D1011_2017_01_02_19_20 /root/Bugatone-Space/parameters/operational/
RUN ln -s /root/Bugatone-Space/python /root/Bugatone-Space/pybuga

ADD ./mobileproduct/lib/linux_x86/Release /root/mobileproduct/lib/linux_x86/Release
ADD ./mobileproduct/pymobileproduct /root/mobileproduct/pymobileproduct
ADD ./mobileproduct/setup.py /root/mobileproduct/setup.py

ADD ./device_communication/cpp/lib/linux_x86/Release /root/device_communication/cpp/lib/linux_x86/Release
ADD ./device_communication/pydcomm /root/device_communication/pydcomm
ADD ./device_communication/setup.py /root/device_communication/setup.py

ADD ./oppo_daemon/all_daemons/2019.0116.01_sgn/daemon_flow_single_player.yaml /root/oppo_daemon/all_daemons/2019.0116.01_sgn/daemon_flow_single_player.yaml
ADD ./oppo_daemon/device_configurations /root/oppo_daemon/device_configurations
ADD ./oppo_daemon/detection_signals /root/oppo_daemon/detection_signals

RUN pip install -e /root/Bugatone-Space/
RUN pip install -e /root/mobileproduct/
RUN pip install -e /root/device_communication/

ENV LD_LIBRARY_PATH=/root/Bugatone-Space/lib/linux_x86:.
WORKDIR /root/mobileproduct/lib/linux_x86/Release