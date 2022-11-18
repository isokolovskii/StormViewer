#!/bin/sh
set -eo pipefail

UPLOADER_VERSION=2.14
AUTO_UPDATE="true"
COMMENT=""
SERVER_ENDPOINT=https://upload.testfairy.com
APP_FILENAME=Storm\ Viewer.ipa

/bin/echo -n "Uploading ${APP_FILENAME} to TestFairy.. "
JSON=$( curl -s ${SERVER_ENDPOINT}/api/upload -F api_key=${TESTFAIRY_API_KEY} -F file="@${APP_FILENAME}" -F comment="${COMMENT}" -F auto-update="${AUTO_UPDATE}" -A "TestFairy Command Line Uploader ${UPLOADER_VERSION}" )

URL=$( echo ${JSON} | sed 's/\\\//\//g' | sed -n 's/.*"build_url"\s*:\s*"\([^"]*\)".*/\1/p' )
if [ -z "$URL" ]; then
	echo "FAILED!"
	echo
	echo "Build uploaded, but no reply from server. Please contact support@testfairy.com"
	exit 1
fi

export URL=${URL}

echo "OK!"
echo
echo "Build was successfully uploaded to TestFairy and is available at:"
echo ${URL}
