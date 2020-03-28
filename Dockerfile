FROM runmymind/docker-android-sdk

RUN chmod o+rw /opt/android-sdk-linux

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