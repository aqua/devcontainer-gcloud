#!/bin/bash
set -e -x
source dev-container-features-test-lib
# Run the main consolidated test script
/bin/bash "$(dirname "$0")/test.sh"
check "gcloud spanner emulator installed" \
  sh -c 'gcloud help beta emulators spanner 2>&1 | grep -i NAME'
reportResults
