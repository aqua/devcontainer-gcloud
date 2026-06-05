#!/bin/bash
set -e -x
source dev-container-features-test-lib
# Run the main consolidated test script
/bin/bash "$(dirname "$0")/test.sh"
check "gcloud firestore emulator installed" \
  sh -c 'gcloud help emulators firestore 2>&1 | grep -i NAME'
reportResults
