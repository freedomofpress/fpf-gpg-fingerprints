#!/bin/bash
# Create detached signature file for validating contents
# of the gpgsync key master list.
set -e
set -x

# Declare filenames for signing. The ".sig" suffix
# is hardcoded in gpgsync and cannot be changed.
gpgsync_fingerprints_file="fingerprints.txt"
gpgsync_signature_file="${gpgsync_fingerprints_file}.sig"

# Full fingerprint for FPF Authority Signing Key.
signing_pubkey="F81962A54902300F72ECB83AA1FC1F6AD2D09049"

# Are we on Qubes? Lets change the gpg binary location
if [ -f /usr/bin/qubes-gpg-client ]; then
    gpg="qubes-gpg-client"
else
    gpg="gpg"
fi

# Sanity-checking: let's make sure we have the private key locally.
# Private keys stored on hardware tokens must have a stub in the
# local keyring, which this check will catch.
"${gpg}" -qK "${signing_pubkey}" > /dev/null

# Write detached signature file.
"${gpg}" --armor --detach-sign \
    -u "${signing_pubkey}" \
    "${gpgsync_fingerprints_file}" \
    > "${gpgsync_signature_file}"

# Sanity-checking: signature must be valid.
"${gpg}" --verify "${gpgsync_signature_file}" "${gpgsync_fingerprints_file}"
