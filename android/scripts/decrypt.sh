#!/bin/bash
# Deployment script for ÉTSMobile on Android
# Club App|ETS

# Since Travis-CI deletes the modifications during the build, we need to decrypt the secrets another time
pwd
openssl version -v
openssl aes-256-cbc -k "$ENCRYPTED_ETSMOBILE_KEYSTORE_PW" -in ./encrypted/etsm_upload_ks.jks.encrypted -out ./etsm_upload_ks.jks -d
openssl aes-256-cbc -k "$ENCRYPTED_KEYSTORE_PROPERTIES_PW" -in ./encrypted/keystore.properties.encrypted -out ./keystore.properties -d
