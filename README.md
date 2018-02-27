# Docker container for Kinetis Design Studio

## Usage 

Use the following command to build a KDS project:

```
docker run \
    --user=`id -u`:`id -g` \
    --rm \
    -i \
    -v <solutiondir>:/data \
    aunsbjerg/docker-kinetis-design-studio \
    kds <projectdir> <project>
```

Where `<solutiondir>` is the folder containing the project to build. `<projectdir>` refers 
to the folder containing the actual project and `<project>` is the name and configuration of
the project, ie. `name/debug`.

## Building base image

The kinetis design studio .deb file must be supplied with the docker build command, since
I'm too lazy/stupid to automate the download from nxp's website.

A docker build could look like this:

```
docker build \
    --squash \
    --build-arg KDS_NAME=<kds.deb> \
    --build-arg KDS_DIR=<install-dir> \
    -t <imagename> \
    .
```