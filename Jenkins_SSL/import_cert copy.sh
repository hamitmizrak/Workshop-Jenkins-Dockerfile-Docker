#!/bin/bash

# Sertifika dosyasının URL'sini belirtin
CERT_URL="https://your-cert-url/jenkins-cert.pem"

# Sertifika dosyasının adını belirtin
CERT_FILE="jenkins-cert.pem"

# Alias adı (sertifika için)
CERT_ALIAS="jenkins-cert"

# Varsayılan Java keystore şifresi
KEYSTORE_PASS="changeit"

# JAVA_HOME'un ayarlanıp ayarlanmadığını kontrol edin
if [ -z "$JAVA_HOME" ]; then
    echo "JAVA_HOME değişkeni ayarlı değil. JAVA_HOME'unu ayarlayın veya manuel olarak girin."
    read -p "Lütfen Java kurulum yolunu girin: " JAVA_HOME
fi

# Sertifika dosyasını indir (wget veya curl kullanarak)
echo "Sertifika indiriliyor..."
wget -O $CERT_FILE $CERT_URL

if [ $? -ne 0 ]; then
    echo "Sertifika indirme başarısız oldu. Lütfen URL'yi kontrol edin."
    exit 1
fi

# Sertifika dosyasının başarıyla indirildiğini kontrol edin
if [ ! -f "$CERT_FILE" ]; then
    echo "Sertifika dosyası bulunamadı. İşlem sonlandırılıyor."
    exit 1
fi

# Keytool ile sertifikayı Java'nın cacerts dosyasına ekle
echo "Sertifika Java keystore'a ekleniyor..."
sudo keytool -import -alias $CERT_ALIAS -keystore "$JAVA_HOME/lib/security/cacerts" -file $CERT_FILE -storepass $KEYSTORE_PASS -noprompt

if [ $? -eq 0 ]; then
    echo "Sertifika başarıyla eklendi!"
else
    echo "Sertifika eklenirken bir hata oluştu."
    exit 1
fi

# Geçici sertifika dosyasını sil
rm -f $CERT_FILE

echo "İşlem tamamlandı."
