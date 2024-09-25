#!/bin/bash

# openssl req -newkey rsa:2048 -nodes -keyout jenkins.key -x509 -days 365 -out jenkins.crt

# Sertifika dosyası ve alias ismi
CERT_FILE="jenkins-cert.pem"
CERT_ALIAS="jenkins-cert"
JAVA_HOME="C:\Program Files\Java\jdk-11.0.16.1"

# JAVA_HOME kontrolü ve Java güvenlik dizini
if [ -z "$JAVA_HOME" ]; then
    echo "JAVA_HOME değişkeni tanımlı değil. Lütfen JAVA_HOME'u ayarlayın."
    exit 1
fi

echo "$JAVA_HOME"

# Keytool komutunu çalıştır
keytool -import -alias $CERT_ALIAS -keystore "$JAVA_HOME/lib/security/cacerts" -file $CERT_FILE -storepass changeit -noprompt

echo "Sertifika başarıyla yüklendi."
