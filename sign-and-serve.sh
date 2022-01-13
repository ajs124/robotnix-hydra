#!/usr/bin/env bash
set -euo pipefail
PATH=@extra_path@:$PATH

tmpdir="$(mktemp -d)"
trap "rm -rf \"$tmpdir\"" EXIT

pushd "$tmpdir"

umask 0027

cat /run/secrets/robotnix/keystore_pw |\
    gpg --batch --yes --passphrase-fd 0 -o - --decrypt @robotnix_keystore_encrypted@ |\
    tar x

for release_script in @release_scripts@; do
    mkdir out
    pushd out
    $release_script "$tmpdir/keys" || :
    popd
    chmod o+r out/*
    rsync -p -r -e "ssh -i /run/secrets/robotnix/ssh_key" ./out/ rup@hetzner-stuff.wg:/srv/http/robotnix/
    rm -rf out
done

popd
