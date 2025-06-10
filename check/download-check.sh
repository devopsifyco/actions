#!/usr/bin/env bash
set -e
# If check already exists, skip download
if [[ -f checkctl ]]; then
  echo "check binary already exists, skipping download."
  exit 0
fi

OS=$(uname -s)
ARCH=$(uname -m)
if [[ "$OS" == "Linux" && "$ARCH" == "x86_64" ]]; then
  ASSET="check-linux-amd64"
elif [[ "$OS" == "Linux" && "$ARCH" == "aarch64" ]]; then
  ASSET="check-linux-arm64"
elif [[ "$OS" == "Darwin" && "$ARCH" == "x86_64" ]]; then
  ASSET="check-macos-intel"
elif [[ "$OS" == "Darwin" && "$ARCH" == "arm64" ]]; then
  ASSET="check-macos-arm64"
else
  echo "Unsupported OS/ARCH: $OS/$ARCH"
  exit 1
fi

VERSION="${1:-}"
if [[ -n "$VERSION" ]]; then
  RELEASE_URL="https://api.github.com/repos/devopsifyco/check-cli/releases/tags/$VERSION"
else
  RELEASE_URL="https://api.github.com/repos/devopsifyco/check-cli/releases/latest"
fi

echo "Release URL: $RELEASE_URL"
RELEASE_RESPONSE=$(curl -sL "$RELEASE_URL")
LATEST_URL=$(echo "$RELEASE_RESPONSE" | grep browser_download_url | grep "$ASSET" | cut -d '"' -f 4)
if [[ -z "$LATEST_URL" ]]; then
  echo "Could not find a download URL for asset: $ASSET"
  echo "Full release response:"
  echo "$RELEASE_RESPONSE"
  exit 1
fi
echo "Downloading $LATEST_URL"
curl -L "$LATEST_URL" -o check-download
mv check-download checkctl
chmod +x checkctl 