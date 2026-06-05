#!/bin/bash
set -e

VERSION=${VERSION:-"latest"}

echo "Activating feature 'gcloud'"
echo "Installing Google Cloud CLI version: ${VERSION}"

# The 'install.sh' entrypoint script is always executed as the root user.
export DEBIAN_FRONTEND=noninteractive

# Ensure required packages are installed
echo "Installing dependencies..."
apt-get update -y
apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    gnupg \
    curl

# Add Google Cloud SDK GPG key
echo "Adding Google Cloud SDK GPG key..."
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

# Add Google Cloud SDK APT repository
if ! grep -qr packages.cloud.google.com/apt /etc/apt/sources.list* ; then
  echo "Adding Google Cloud SDK APT repository..."
  echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
fi

# Install Google Cloud CLI
echo "Installing google-cloud-cli..."
apt-get update -y

INSTALL_VERSION=""
if [ "${VERSION}" != "latest" ]; then
    INSTALL_VERSION="=${VERSION}-0"
fi

apt-get install -y --no-install-recommends google-cloud-cli${INSTALL_VERSION}

if [ "${DATASTORE_EMULATOR:-false}" = "true" ] ; then
  echo "Installing google-cloud-cli-datastore-emulator..."
  apt-get install -y --no-install-recommends \
    google-cloud-cli-datastore-emulator
fi
if [ "${FIRESTORE_EMULATOR:-false}" = "true" ] ; then
  echo "Installing google-cloud-cli-firestore-emulator..."
  apt-get install -y --no-install-recommends \
    google-cloud-cli-firestore-emulator
fi
if [ "${BIGTABLE_EMULATOR:-false}" = "true" ] ; then
  echo "Installing google-cloud-cli-bigtable-emulator..."
  apt-get install -y --no-install-recommends \
    google-cloud-cli-bigtable-emulator
fi
if [ "${PUBSUB_EMULATOR:-false}" = "true" ] ; then
  echo "Installing google-cloud-cli-pubsub-emulator..."
  apt-get install -y --no-install-recommends \
    google-cloud-cli-pubsub-emulator
fi
if [ "${APPENGINE_GO:-false}" = "true" ] ; then
  echo "Installing google-cloud-cli-app-engine-go..."
  apt-get install -y --no-install-recommends\
    google-cloud-cli-app-engine-go
fi
if [ "${APPENGINE_JAVA:-false}" = "true" ] ; then
  echo "Installing google-cloud-cli-app-engine-java..."
  apt-get install -y --no-install-recommends \
    google-cloud-cli-app-engine-java
fi
if [ "${APPENGINE_PYTHON:-false}" = "true" ] ; then
  echo "Installing google-cloud-cli-app-engine-python..."
  apt-get install -y --no-install-recommends \
    google-cloud-cli-app-engine-python \
    google-cloud-cli-app-engine-python-extras
fi

echo "Google Cloud CLI installation complete!"
echo "Use 'gcloud --version' to verify the installation"
