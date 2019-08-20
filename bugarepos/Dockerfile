FROM bugabase

RUN mkdir -p /root/Bugatone-Space/parameters/operational && \
    mkdir -p /root/Bugatone-Space/lib/linux_x86 && \
    mkdir -p /root/mobileproduct/lib/linux_x86/Release && \
    mkdir -p /root/device_communication/lib/linux_x86/Release && \
    mkdir -p /root/oppo_daemon/all_daemons/2019.0116.01_sgn/

ADD ./ /root
RUN ln -s /root/Bugatone-Space/python /root/Bugatone-Space/pybuga && pip install -e /root/Bugatone-Space/ -e /root/mobileproduct/ -e /root/device_communication/
ENV LD_LIBRARY_PATH=/root/Bugatone-Space/lib/linux_x86:.
WORKDIR /root/mobileproduct/lib/linux_x86/Release