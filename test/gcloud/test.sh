#!/bin/bash

set -e -x

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
check "gcloud is installed" gcloud --version
check "gcloud help works" sh -c 'gcloud help 2>&1 | grep -i "name"'

# Report result
reportResults
