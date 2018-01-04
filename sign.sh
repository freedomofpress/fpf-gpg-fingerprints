#!/bin/bash
# Create detached signature file for validating contents
# of the gpgsync key master list.
set -e
set -x

# Declare filenames for signing. The ".sig" suffix
# is hardcoded in gpgsync and cannot be changed.
gpgsync_fingerprints_file="fingerprints.txt"
gpgsync_signature_file="${gpgsync_fingerprints_file}.sig"

# Full fingerprints for @conorsch's pubkeys.
signing_pubkey="0B095DF428491E147B615CD3F08893B959CAB065"

# Sanity-checking: let's make sure we have the private key locally.
gpg -qK "${signing_pubkey}" > /dev/null

# Write detached signature file.
gpg --armor --detach-sign \
    --output "${gpgsync_signature_file}" \
    -u "${signing_pubkey}" \
    "${gpgsync_fingerprints_file}"

# Sanity-checking: signature must be valid.
gpg --verify "${gpgsync_signature_file}" "${gpgsync_fingerprints_file}"
