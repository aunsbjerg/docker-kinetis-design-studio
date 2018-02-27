FROM krallin/ubuntu-tini:16.04
LABEL maintainer "Mikkel Jakobsen <mikkelaunsbjerg@gmail.com>"

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y \
    build-essential \
    default-jre \
    libc6:i386 \
    libncurses5:i386 \
    libstdc++6:i386

ARG KDS_NAME=kinetis-design-studio_3.2.0-1_amd64.deb
ARG KDS_DIR=/opt/Freescale/KDS_v3
ENV PATH="${KDS_DIR}/bin/:${PATH}"

ADD ${KDS_NAME} kds.deb
RUN dpkg --unpack kds.deb 
RUN rm kds.deb

ADD kds /usr/local/bin/kds
RUN chmod +x /usr/local/bin/kds

ENV PATH="${KDS_DIR}/bin/:${PATH}"
ENV PATH="${KDS_DIR}/eclipse/:${PATH}"
ENV PATH="${KDS_DIR}/toolchain/bin/:${PATH}"

VOLUME ["/data"]
WORKDIR /data

CMD ["/bin/bash"]