#!/bin/bash

pod deintegrate
rm -rf ./Podfile.lock ./memeGrave.xcworkspace ./Pods
pod install
open ./*.xcworkspace
