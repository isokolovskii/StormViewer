#!/bin/sh
set -eo pipefail

gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/StormViewer_Distribution.mobileprovision ./.github/secrets/StormViewer_Distribution.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/ios_distribution.p12 ./.github/secrets/ios_distribution.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/StormViewer_Distribution.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/StormViewer_Distribution.mobileprovision
