#!/bin/bash
set -e
source dev-container-features-test-lib
# Run the main consolidated test script
/bin/bash "$(dirname "$0")/test.sh"
check "gcloud appengine-python SDK installed" \
  sh -c 'gcloud components list | grep app-engine-python | grep -i installed'
reportResults
