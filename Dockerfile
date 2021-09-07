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

# copy some command aliases that need to be early on the path
COPY mypackagelist /opt/mypackagelist

RUN /opt/mypackagelist/install-packages.sh

RUN apt-get update -yqq && \
    apt-get install -y \
    fdroidserver && \
    apt-get clean

RUN cd /usr/share/doc/fdroidserver/examples && \
    wget https://raw.githubusercontent.com/f-droid/fdroidserver/master/examples/config.py && \
    wget https://raw.githubusercontent.com/f-droid/fdroidserver/master/examples/fdroid-icon.png && \
    wget https://raw.githubusercontent.com/f-droid/fdroidserver/master/examples/makebuildserver.config.py && \
    wget https://raw.githubusercontent.com/f-droid/fdroidserver/master/examples/opensc-fdroid.cfg && \
    wget https://raw.githubusercontent.com/f-droid/fdroidserver/master/examples/public-read-only-s3-bucket-policy.json && \
    wget https://raw.githubusercontent.com/f-droid/fdroidserver/master/examples/template.yml
