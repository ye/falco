FROM centos:6

RUN yum -y install centos-release-scl-rh \
        epel-release

RUN yum -y install \
	devtoolset-6-toolchain \
        dpkg \
        dpkg-devel \
	git \
        glibc-static \
	jq \
        make \
        pkg-config \
        rpm-build \
        unzip \
        wget \
        tar \
        autoconf \
        automake \
	cmake3 \
        libtool && \
    yum -y install \
        glibc-devel.i686 \
        devtoolset-6-libstdc++-devel.i686 \
        devtoolset-6-elfutils-libelf-devel && \
    yum clean all

ADD docker-builder-entrypoint.sh /
ENTRYPOINT [ "/docker-builder-entrypoint.sh" ]
