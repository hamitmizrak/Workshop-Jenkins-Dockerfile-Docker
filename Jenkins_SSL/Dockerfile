
# Temel olarak Jenkins'in resmi Docker görüntüsünü kullanıyoruz.
FROM jenkins/jenkins:lts

# Gerekli olan bağımlılıkları kuruyoruz.
USER root

# RUN apt-get update && apt-get install -y sudo
RUN apt-get update && apt-get install -y

# Jenkins çalıştırılabilir hale getiriliyor ve kullanıcı izinleri ayarlanıyor.
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Jenkins çalıştırılabilir hale getiriliyor ve kullanıcı izinleri ayarlanıyor.
RUN echo "Dockerfile başladı"

# Jenkins kullanıcısına geçiş yapılıyor.
USER jenkins

# Jenkins portunu açıyoruz
EXPOSE 8080

# Jenkins kurulumunu tamamladıktan sonra otomatik başlatmayı sağlamak için komut
# ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]

#################################################################################
# # SSL

# # Sertifika ve anahtar dosyalarını ekliyoruz
# COPY jenkins-cert.pem /var/lib/jenkins/jenkins-cert.pem

# # Jenkins HTTPS yapılandırması için gerekli ortam değişkenlerini ayarlıyoruz
# ENV JENKINS_HTTPS_PORT=8443
# ENV JENKINS_HTTPS_KEYSTORE=/var/lib/jenkins/jenkins.pem
# ENV JENKINS_HTTPS_KEYSTORE_PASSWORD=changeit

# # Jenkins'in varsayılan bağlantı portunu HTTPS portuna yönlendiriyoruz
# EXPOSE 8443

# RUN chown jenkins:jenkins /var/lib/jenkins/jenkins.pem

# # Jenkins'e SSL ayarlarını yapmak için JAVA_OPTS ayarını düzenliyoruz
# ENV JAVA_OPTS="-Djenkins.httpPort=-1 -Djenkins.httpsPort=$JENKINS_HTTPS_PORT -Djenkins.httpsKeyStore=$JENKINS_HTTPS_KEYSTORE -Djenkins.httpsKeyStorePassword=$JENKINS_HTTPS_KEYSTORE_PASSWORD"
