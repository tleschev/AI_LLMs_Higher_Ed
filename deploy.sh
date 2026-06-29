#!/usr/bin/env bash
#
# Deploy the MkDocs site to GitHub Pages, password-protected with StatiCrypt.
#
# Usage:
#   STATICRYPT_PASSWORD='your-shared-password' ./deploy.sh
#   ./deploy.sh        # prompts for the password (hidden input)
#
# What it does:
#   1. Builds the site with MkDocs (-> site/)
#   2. Encrypts every HTML page with StatiCrypt (CSS/JS/images left intact)
#   3. Force-pushes the encrypted output to the gh-pages branch
#
# Security: the password is NEVER written to the repository. Only the public
# salt in .staticrypt.json is committed (that is safe and required so the
# "Remember me" option keeps working across redeploys).
#
set -euo pipefail

cd "$(dirname "$0")"

ENC_DIR=".deploy_enc"          # temporary encrypted output (gitignored)
REMEMBER_DAYS=30               # how long the browser remembers the password
STATICRYPT_VERSION="staticrypt@3"

# --- Resolve the password ---------------------------------------------------
if [[ -z "${STATICRYPT_PASSWORD:-}" ]]; then
  read -rsp "StatiCrypt password: " STATICRYPT_PASSWORD
  echo
fi
export STATICRYPT_PASSWORD

if [[ -z "$STATICRYPT_PASSWORD" ]]; then
  echo "Error: empty password, aborting." >&2
  exit 1
fi
if (( ${#STATICRYPT_PASSWORD} < 14 )); then
  echo "Warning: password is shorter than 14 chars; a longer one is recommended for public files." >&2
fi

# --- Build ------------------------------------------------------------------
echo "==> Building site with MkDocs..."
mkdocs build --clean

# --- Encrypt ----------------------------------------------------------------
echo "==> Encrypting HTML pages with StatiCrypt..."
rm -rf "$ENC_DIR"
npx --yes "$STATICRYPT_VERSION" site -r -d "$ENC_DIR" \
  --config .staticrypt.json \
  --remember "$REMEMBER_DAYS" \
  --short

# StatiCrypt mirrors the input path under the output dir: result is $ENC_DIR/site
PUBLISH_DIR="$ENC_DIR/site"

# --- Safety checks before publishing ----------------------------------------
if [[ ! -f "$PUBLISH_DIR/index.html" ]]; then
  echo "Error: expected encrypted output at $PUBLISH_DIR/index.html not found." >&2
  exit 1
fi
if ! grep -qI "staticrypt" "$PUBLISH_DIR/index.html"; then
  echo "Error: index.html does not look encrypted; aborting to avoid leaking plaintext." >&2
  exit 1
fi
echo "==> Encryption verified."

# --- Publish to gh-pages ----------------------------------------------------
echo "==> Publishing encrypted site to gh-pages..."
ghp-import -n -p -f -m "Deploy encrypted site (StatiCrypt)" "$PUBLISH_DIR"

# --- Cleanup ----------------------------------------------------------------
rm -rf "$ENC_DIR"
echo "==> Done. Encrypted site deployed to gh-pages."
