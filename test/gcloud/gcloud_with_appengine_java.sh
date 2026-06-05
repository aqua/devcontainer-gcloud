#!/bin/bash
set -e -x
source dev-container-features-test-lib
# Run the main consolidated test script
/bin/bash "$(dirname "$0")/test.sh"
check "gcloud appengine-java SDK installed" \
  sh -c 'gcloud components list | grep app-engine-java | grep -i installed'
reportResults
