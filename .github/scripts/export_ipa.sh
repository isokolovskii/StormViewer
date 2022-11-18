#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $PWD/build/StormViewer.xcarchive \
           -exportOptionsPlist StormViewer/exportOptions.plist \
           -exportPath $PWD/build \
           -allowProvisioningUpdates \
           -exportArchive | xcpretty
