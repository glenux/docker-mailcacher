# Docker-Mailcatcher

## Supported tags and respective Dockerfile links

* [`0.7.1`](https://github.com/glenux/docker-mailcacher/blob/v0.7.1/Dockerfile), [`0.7`](https://github.com/glenux/docker-mailcacher/blob/v0.7.1/Dockerfile), [`latest`](https://github.com/glenux/docker-mailcacher/blob/v0.7.1/Dockerfile)

<!--

Quick reference
Where to get help: the Docker Community Forums, the Docker Community Slack, or Stack Overflow

Where to file issues: https://github.com/docker-library/haproxy/issues

Maintained by: the Docker Community

Supported architectures: (more info) amd64, arm32v5, arm32v6, arm32v7, arm64v8, i386, ppc64le, s390x

Published image artifact details: repo-info repo's repos/haproxy/ directory (history) (image metadata, transfer size, etc)

Image updates: official-images PRs with label library/haproxy
official-images repo's library/haproxy file (history)

Source of this description: docs repo's haproxy/ directory (history)

What is HAProxy?
HAProxy is a free, open source high availability solution, providing load balancing and proxying for TCP and HTTP-based applications by spreading requests across multiple servers. It is written in C and has a reputation for being fast and efficient (in terms of processor and memory usage).

wikipedia.org/wiki/HAProxy

logo

How to use this image
Since no two users of HAProxy are likely to configure it exactly alike, this image does not come with any default configuration.

Please refer to upstream's excellent (and comprehensive) documentation on the subject of configuring HAProxy for your needs.

It is also worth checking out the examples/ directory from upstream.

Create a Dockerfile
FROM haproxy:1.7
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
Build the container
$ docker build -t my-haproxy .
Test the configuration file
$ docker run -it --rm --name haproxy-syntax-check my-haproxy haproxy -c -f /usr/local/etc/haproxy/haproxy.cfg
Run the container
$ docker run -d --name my-running-haproxy my-haproxy
You may need to publish the ports your HAProxy is listening on to the host by specifying the -p option, for example -p 8080:80 to publish port 8080 from the container host to port 80 in the container. Make sure the port you're using is free.

Directly via bind mount
$ docker run -d --name my-running-haproxy -v /path/to/etc/haproxy:/usr/local/etc/haproxy:ro haproxy:1.7
Note that your host's /path/to/etc/haproxy folder should be populated with a file named haproxy.cfg. If this configuration file refers to any other files within that folder then you should ensure that they also exist (e.g. template files such as 400.http, 404.http, and so forth). However, many minimal configurations do not require any supporting files.

Reloading config
If you used a bind mount for the config and have edited your haproxy.cfg file, you can use HAProxy's graceful reload feature by sending a SIGHUP to the container:

$ docker kill -s HUP my-running-haproxy
The entrypoint script in the image checks for running the command haproxy and replaces it with haproxy-systemd-wrapper from HAProxy upstream which takes care of signal handling to do the graceful reload. Under the hood this uses the -sf option of haproxy so "there are two small windows of a few milliseconds each where it is possible that a few connection failures will be noticed during high loads" (see Stopping and restarting HAProxy).

Image Variants
The haproxy images come in many flavors, each designed for a specific use case.

haproxy:<version>
This is the defacto image. If you are unsure about what your needs are, you probably want to use this one. It is designed to be used both as a throw away container (mount your source code and start the container to start your app), as well as the base to build other images off of.

haproxy:<version>-alpine
This image is based on the popular Alpine Linux project, available in the alpine official image. Alpine Linux is much smaller than most distribution base images (~5MB), and thus leads to much slimmer images in general.

This variant is highly recommended when final image size being as small as possible is desired. The main caveat to note is that it does use musl libc instead of glibc and friends, so certain software might run into issues depending on the depth of their libc requirements. However, most software doesn't have an issue with this, so this variant is usually a very safe choice. See this Hacker News comment thread for more discussion of the issues that might arise and some pro/con comparisons of using Alpine-based images.

To minimize image size, it's uncommon for additional related tools (such as git or bash) to be included in Alpine-based images. Using this image as a base, add the things you need in your own Dockerfile (see the alpine image description for examples of how to install packages if you are unfamiliar).

License
View license information for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

Some additional license information which was able to be auto-detected might be found in the repo-info repository's haproxy/ directory.

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.

-->
