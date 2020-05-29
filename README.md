# FPF GPG Fingerprints

This repository contains an up-to-date list of PGP fingerprints used by Freedom of the Press Foundation. The list is signed by the Freedom of the Press Foundation authority key. Here is the authority key:

```
pub   rsa4096 2018-01-21 [SC] [expires: 2021-01-20]
      F81962A54902300F72ECB83AA1FC1F6AD2D09049
uid           [ unknown] FPF Authority (Freedom of the Press Foundation Authority Signing Key)
```

The full public key for the FPF Authority key is [included in the repository](https://raw.githubusercontent.com/freedomofpress/fpf-gpg-fingerprints/master/fpf-authority.pub.asc).

## Install GPG Sync
If you're using macOS, fetch the [latest GPG Sync release](https://github.com/firstlookmedia/gpgsync/releases).

If you're a Freedom of the Press Foundation employee and using Linux, `make workstation` should install through the `gpgsync` role.

## Set up GPG Sync

To configure our [GPG Sync](https://github.com/firstlookmedia/gpgsync) endpoint, use these values:

* GPG Fingerprint: `F81962A54902300F72ECB83AA1FC1F6AD2D09049`
* Fingerprints URL: `https://raw.githubusercontent.com/freedomofpress/fpf-gpg-fingerprints/master/fingerprints.json`
