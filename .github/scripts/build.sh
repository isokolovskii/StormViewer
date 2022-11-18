#!/bin/bash

set -eo pipefail

mkdir -p build

xcodebuild -project StormViewer.xcodeproj \
           -scheme StormViewer \
           -sdk iphoneos \
           -destination 'generic/platform=iOS' \
           -configuration Release \
           -derivedDataPath $PWD/build/DerivedData \
           -resultBundlePath $PWD/build/StormViewer \
           -archivePath $PWD/build/StormViewer.xcarchive \
           clean archive | xcpretty
