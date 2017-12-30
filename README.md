ECE344 OS/161 Setup
==================

[Docker](https://www.docker.com/) container for the [OS/161](http://os161.eecs.harvard.edu/) setup used in [ECE344 at the University of Toronto](http://www.eecg.toronto.edu/~yuan/teaching/ece344/). This setup is current as of the Winter 2018 term.

Rationale
---------

ECE344 (Operating Systems) is a course at the University of Toronto. In this course, to do the assignments, you need to either set up OS/161 locally, or use the eecg machines.

I prefer being able to do my work without requiring a network connection. However, the installation process requires several configuration changes that can potentially break other parts of your system.

This Docker setup contains a fully set up development environment for ECE344 coursework, avoiding issues such as GCC versions, ncurses compatibility, and having to manually copy and paste commands around.

Usage
-----

You do not need to clone or download this repository.

1. Make sure you have Docker - refer to the [official Docker installation instructions](https://docs.docker.com/engine/installation/) for details. (Make sure you add yourself to the docker group, otherwise you need to run $sudo for every docker command)
2. Download and extract [ECE344 OS/161 sources](http://www.eecg.toronto.edu/~yuan/teaching/ece344/os161/sources/os161-1.11.tar.gz) into a convenient folder. This will be where you can work on the OS/161 code in here.
3. Download [start-interactive-ece344-shell.sh](https://github.com/tech4me/ECE344-development-environment/blob/master/start-interactive-ece344-shell.sh) into the same directory as above
4. Run `start-interactive-ece344-shell.sh` to open a shell inside a Docker environment with everything set up. If this is the first run, this might take a while to start while Docker downloads the image from Docker Hub.

After this you can follow the instruction from the course website to build your first kernel, run user code on it, and setup your version control.

The original author also provided a script that builds and runs the kernel with a debugger, I did not include it here because I use a different setup. However, you can check it out and it should be very easy to make it work for ECE344 instead of CS350.

Now you can do your assignments by editing files in os161(this can be done outside of the Docker container, if you prefer).

Building
--------

This section contains instructions for building the Docker image from scratch. You probably don't need to do this unless you're making your own image based on this one. If you just want to do your assignments in the development environment, refer to the "Usage" section above.

1. Make sure you have Docker - refer to the [official Docker installation instructions](https://docs.docker.com/engine/installation/) for details.
2. Download the [ECE344 OS/161 toolchain](http://www.eecg.toronto.edu/~yuan/teaching/ece344/os161/sources/os161-toolchain.tar.gz)

To build the image, run the following in the repository root:

```bash
docker build -t <name-of-your-tag> .
```

There will be a lot of warnings, but give it at least a few minutes and it'll build.

Issue
-----

1. I used latest LTS ubuntu as my base docker image(as the time of writing this, it is 16.04), this might change later on

License
-------

The files that are part of this project are made available under the 3-Clause BSD license - see `LICENSE.txt` for details. That means you are free to copy/modify/distribute them with very few restrictions.
