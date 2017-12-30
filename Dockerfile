FROM ubuntu:latest
MAINTAINER Shizhang Yin <guiwanglong@gmail.com>

# Setup Docker image with the provided toolchain from course website

# Preliminary setup
RUN apt-get update
RUN apt-get install build-essential --yes
# Needed for binutils
RUN apt-get install gettext --yes
# Needed for gdb
RUN apt-get install libncurses5-dev --yes

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
