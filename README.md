# react-native-ibm-analytics
[![npm version](https://badge.fury.io/js/react-native-watson.svg)](https://badge.fury.io/js/react-native-ibm-analytics)


## Overview

### Services
## Install

```shell
npm install --save react-native-ibm-analytics

```
## Android
(NOT YET IMPLEMENTED)
Android installation is done with ```react-native link react-native-watson```

minSdkVersion 19
targetSdkVersion 26

## iOS

### Manually link

Copy RNWatson.m and RNWatson.swift from node_modules/react-native-watson/ios into your project.  You will be prompted to create a bridging header.  Accept and place the below into the header:

```obj-c
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
```

#### Dependency Management

We recommend using [Carthage](https://github.com/Carthage/Carthage) to manage dependencies and build the Swift SDK for your application.

You can install Carthage with [Homebrew](http://brew.sh/):

```bash
$ brew update
$ brew install carthage
```

Then, navigate to the root directory of your project (where your .xcodeproj file is located) and create an empty `Cartfile` there:

```bash
$ touch Cartfile
```

Create a `Cartfile` to get IBM Mobile Analytics:

```
github "ibm-bluemix-mobile-services/bms-clientsdk-swift-analytics"
```

Then run the following command to build the dependencies and frameworks:

```bash
$ carthage update
```

##### Add the Frameworks to your project

Drag-and-drop the built frameworks into your Xcode project (put them in a Frameworks group for better management).  You will also need to click on your project in Xcode and go to the General section.  Add all of the frameworks to Embedded Binaries.

Note, before you can upload to itunesconnect your will need to strip unwanted architectures from the frameworks.  This is done easily with a build script.  See the following link for instructions: http://ikennd.ac/blog/2015/02/stripping-unwanted-architectures-from-dynamic-libraries-in-xcode/
