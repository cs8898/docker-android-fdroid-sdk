# docker-android-fdroid-sdk

[![docker build](https://img.shields.io/docker/cloud/build/cs8898/android-fdroid-sdk)](https://hub.docker.com/r/cs8898/android-fdroid-sdk) [![travis build](https://api.travis-ci.com/cs8898/docker-android-fdroid-sdk.svg)](https://app.travis-ci.com/github/cs8898/docker-android-fdroid-sdk)

dockerhub: [cs8898/android-fdroid-sdk](https://hub.docker.com/r/cs8898/android-fdroid-sdk)

## Android SDK plus F-Droid Server Tools

* Images is based on Ubuntu
* AndroidSDK from ~~[runmymind/docker-android-sdk](https://hub.docker.com/r/runmymind/docker-android-sdk)~~  [cs8898/docker-android-sdk](https://hub.docker.com/r/cs8898/docker-android-sdk)
* F-Droid installed from PackageManager

Works with Jenkins and other Docker Enabled CI

## Used AndroidSDK

Current Build has Following Build Tools and Platforms:

| PKG         | Version    |
| ----------- | ---------- |
| build-tools | 31.0.0     |
| build-tools | 30.0.3     |
| platforms   | android-32 |

Compare `/mypackagelist/package-list.txt` and [package-list-minimal.txt](https://github.com/cs8898/docker-android-sdk/blob/master/tools/package-list-minimal.txt)

Build-Tools currently added to PATH `31.0.0`
(Needed for FDroid)

## Docker Tags

Bild Matrix for `BUILD_TOOLS_VERSION`

* `31.0.0` `latest`
* `30.0.2`
