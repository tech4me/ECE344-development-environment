FROM ubuntu:latest
MAINTAINER Shizhang Yin <guiwanglong@gmail.com>

# Setup Docker image with the provided toolchain from course website

# Preliminary setup
RUN apt-get update
# Needed for building
RUN apt-get install binutils make --yes
# Needed for binutils
RUN apt-get install gettext --yes
# Needed for gdb
RUN apt-get install libncurses5-dev --yes
# Install gcc 3.4 to compile the MIPS cross compiler
RUN apt-get install wget --yes
RUN mkdir -p /tmp
WORKDIR /tmp/gcc34
RUN wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/libstdc++6-dev_3.4.6-6ubuntu5_amd64.deb && wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/cpp-3.4_3.4.6-6ubuntu5_amd64.deb && wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/gcc-3.4_3.4.6-6ubuntu5_amd64.deb && wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/gcc-3.4-base_3.4.6-6ubuntu5_amd64.deb && wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/g++-3.4_3.4.6-6ubuntu5_amd64.deb
RUN dpkg -i *deb
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-3.4 50
# Hacks to work with this ancient compiler(This ancient compiler have problems finding stuff)
ENV LIBRARY_PATH /usr/lib/x86_64-linux-gnu
RUN ln -s /lib/x86_64-linux-gnu/libgcc_s.so.1 /lib/libgcc_s.so.1
RUN rm -rf /tmp/gcc34

# Step 1: Download the toolchain into the current directory

# Step 2: Install toochain for os161
ADD os161-toolchain.tar.gz /root/build
WORKDIR /root/build
RUN ./install.sh

# Step 3: Append toolchain bin dir in PATH
ENV PATH /root/cs161/bin:$PATH

# Step 4: Create mount point
VOLUME /root/ece344

# Step 5: Clean up and reset the workdir
WORKDIR /root/ece344
RUN rm -r /root/build
