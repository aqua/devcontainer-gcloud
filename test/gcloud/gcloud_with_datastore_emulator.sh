#!/bin/bash
set -e
source dev-container-features-test-lib
# Run the main consolidated test script
/bin/bash "$(dirname "$0")/test.sh"
check "gcloud datastore emulator installed" \
  sh -c 'gcloud help beta emulators datastore 2>&1 | grep -i NAME'
reportResults
