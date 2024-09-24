# Temel olarak Jenkins'in resmi Docker görüntüsünü kullanıyoruz.
FROM jenkins/jenkins:lts

# Gerekli olan bağımlılıkları kuruyoruz.
USER root
RUN apt-get update && apt-get install -y sudo

# Jenkins çalıştırılabilir hale getiriliyor ve kullanıcı izinleri ayarlanıyor.
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Jenkins kullanıcısına geçiş yapılıyor.
USER jenkins

# Jenkins portunu açıyoruz
EXPOSE 8080
