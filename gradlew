#!/usr/bin/env sh
set -eu
GRADLE_VERSION=8.9
BASE_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
CACHE_DIR="${HOME}/.gradle/custom-wrapper/gradle-${GRADLE_VERSION}"
ZIP_FILE="${HOME}/.gradle/custom-wrapper/gradle-${GRADLE_VERSION}-bin.zip"
if [ ! -x "${CACHE_DIR}/bin/gradle" ]; then
  mkdir -p "$(dirname "$ZIP_FILE")"
  echo "Gradle ${GRADLE_VERSION} indiriliyor..."
  if command -v curl >/dev/null 2>&1; then
    curl -L --fail --retry 3 "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -o "$ZIP_FILE"
  elif command -v wget >/dev/null 2>&1; then
    wget -O "$ZIP_FILE" "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
  else
    echo "curl veya wget bulunamadı." >&2
    exit 1
  fi
  rm -rf "$CACHE_DIR"
  mkdir -p "$(dirname "$CACHE_DIR")"
  unzip -q "$ZIP_FILE" -d "$(dirname "$CACHE_DIR")"
fi
exec "${CACHE_DIR}/bin/gradle" -p "$BASE_DIR" "$@"
