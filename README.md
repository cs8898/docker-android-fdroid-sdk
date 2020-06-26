# docker-android-fdroid-sdk

[![docker build](https://img.shields.io/docker/cloud/build/cs8898/android-fdroid-sdk)](https://hub.docker.com/r/cs8898/android-fdroid-sdk)  
dockerhub: [cs8898/android-fdroid-sdk](https://hub.docker.com/r/cs8898/android-fdroid-sdk)

## Android SDK plus F-Droid Server Tools

* Images is based on Ubuntu
* AndroidSDK from [runmymind/docker-android-sdk](https://hub.docker.com/r/runmymind/docker-android-sdk)  
* F-Droid installed from PackageManager

Works with Jenkins and other Docker Enabled CI

## Used AndroidSDK

Current Build has Following Build Tools and Platforms:

| PKG         | Version    |
| ----------- | ---------- |
| build-tools | 28.0.3     |
| build-tools | 29.0.2     |
| platforms   | android-28 |
| platforms   | android-29 |

Build-Tools currently added to PATH `29.0.2`
(Needed for FDroid)
