FROM 163732804125.dkr.ecr.eu-central-1.amazonaws.com/bugatone/synapticsbase:latest

RUN mkdir -p /root/Bugatone-Space/parameters/operational && \
    mkdir -p /root/Bugatone-Space/lib/linux_x86 && \
    mkdir -p /root/mobileproduct/lib/linux_x86/Release && \
    mkdir -p /root/device_communication/lib/linux_x86/Release && \
    mkdir -p /root/oppo_daemon/all_daemons/2019.0116.01_sgn/

ADD ./ /root

RUN ln -s /root/Bugatone-Space/python /root/Bugatone-Space/pybuga \
    && ln -s /home/buga/tmp_dir /root/tmp_dir \
    && ln -s /root/mobileproduct/ /home/buga/mobileproduct \
    && ln -s /root/device_communication/ /home/buga/device_communication \
    && ln -s /root/Bugatone-Space/ /home/buga/Bugatone-Space \
    && pip install -e /root/Bugatone-Space/ -e /root/mobileproduct/ -e /root/device_communication/

ENV LD_LIBRARY_PATH=/root/Bugatone-Space/lib/linux_x86:.
ENV PYTHONPATH "${PYTHONPATH}:/root/Bugatone-Space/python"
ENV BUGATONE_ROOT=/root/Bugatone-Space
WORKDIR /root/mobileproduct/lib/linux_x86/Release
