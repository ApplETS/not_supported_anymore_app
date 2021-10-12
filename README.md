# Not supported anymore app

A small project to show a not supported anymore splash screen instead of the previous app. and a link to download the next supported version.

## Getting Started
To build this project simply download and install flutter and
```sh
$ flutter pub get
$ flutter run
```
If there is a problem whil running `flutter pub get`, make sure you have the right version of flutter and dart by doing `flutter channel stable`, then `flutter upgrade`.


To build this project you need to do:
```sh
$ cd android/
$ ./scripts/decrypt.sh
# This was needed to decrypt two files: the etsm_upload_ks.jks and the keystore.properties
# It is needed to sign the application with Notre-Dame v3 build
$ cd ..
$ flutter build appbundle
```