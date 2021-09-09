FROM runmymind/docker-android-sdk:latest

ARG BUILD_TOOLS_VERSION=30.0.2

ENV PATH="/opt/android-sdk-linux/build-tools/${BUILD_TOOLS_VERSION}:${PATH}"

RUN apt-get update -yqq && \
    apt-get install -y libnss-wrapper && \
    apt-get clean

# copy some command aliases that need to be early on the path
COPY tools/* /usr/local/sbin/
RUN chmod a+x /usr/local/sbin/run_as_user && \
    chmod a+x /usr/local/sbin/ssh && \
    chmod a+x /usr/local/sbin/rsync

# install my SDK Packages
COPY mypackagelist /opt/mypackagelist
RUN /opt/mypackagelist/install-packages.sh

# Workaround for non writeable SDK FOLDER
RUN chmod -R g+rw /opt/android-sdk-linux

# install packages for PIL
# See:
# - https://gitlab.com/fdroid/ci-images-base/-/blob/master/Dockerfile
# - https://gist.github.com/azizmb/11343840
RUN build=`uname --hardware-platform` && \
    apt-get update -yqq && \
    apt-get install -y \
    apt-get install python-dev libjpeg62 libjpeg-dev libpng16-16 libpng-dev libfreetype6-dev libffi-dev && \
    ln -s /usr/lib/${build}-linux-gnu/libjpeg.so /usr/lib && \
    ln -s /usr/lib/${build}-linux-gnu/libz.so /usr/lib && \
    apt-get clean

# install python3 for fdroid server
RUN apt-get update -yqq && \
    apt-get install -y \
    python3 python3-pip rsync && \
    apt-get clean

# install the fdroidserver
RUN python3 -m pip install --upgrade setuptools pip && \
    python3 -m pip install setuptools-rust && \
    python3 -m pip install fdroidserver

## Old Workaround for Missing template files...
# RUN cd /usr/share/doc/fdroidserver/examples && \
#     wget https://raw.githubusercontent.com/f-droid/fdroidserver/master/examples/config.py && \
#     wget https://raw.githubusercontent.com/f-droid/fdroidserver/master/examples/fdroid-icon.png && \
#     wget https://raw.githubusercontent.com/f-droid/fdroidserver/master/examples/makebuildserver.config.py && \
#     wget https://raw.githubusercontent.com/f-droid/fdroidserver/master/examples/opensc-fdroid.cfg && \
#     wget https://raw.githubusercontent.com/f-droid/fdroidserver/master/examples/public-read-only-s3-bucket-policy.json && \
#     wget https://raw.githubusercontent.com/f-droid/fdroidserver/master/examples/template.yml
