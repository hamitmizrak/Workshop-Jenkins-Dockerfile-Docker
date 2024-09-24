#!/bin/bash

echo "Genel Kurulumlar"

# User Variable
HTTPS="Jenkins Https"

# Renk dizisini tanımla
colors=(
    "\033[31m" # Kırmızı
    "\033[32m" # Yeşil
    "\033[33m" # Sarı
    "\033[34m" # Mavi
    "\033[35m" # Mor
    "\033[36m" # Camgöbeği
)

########################################################################################################################################
########################################################################################################################################

# Bash scriptlere izin vermek
chmod +x ./countdown.sh

########################################################################################################################################
########################################################################################################################################

########################################################################################################################################
########################################################################################################################################
project_version() {
    # Version
    sleep 2
    echo -e "${colors[5]}Java Version ... "
    java --version

    sleep 2
    echo -e "\n${colors[4]}Maven Version ...  "
    mvn -v

    sleep 2
    echo -e "\n${colors[3]}Git Version ... "
    git -v

     sleep 2
    echo -e "\n${colors[2]}Docker Version ... "
    git -v

    # Geriye Say
    ./countdown.sh

    # Docker Compose ile Jenkins kurulumu başlat
    docker-compose up --build -d
}

project_version

########################################################################################################################################
########################################################################################################################################
jenkins_count_down() {
    # 60'den aşağı say
    for ((i = 2; i >= 0; i--)); do
        color_index=$((i % ${#colors[@]}))         # Renk dizisindeki sıraya göre renk seç
        echo -e "${colors[$color_index]}$i\033[0m" # Sayıyı seçilen renkte yazdır ve renk sıfırla
        sleep 1
    done
}



########################################################################################################################################
########################################################################################################################################
jenkins_restart() {
    # Jenkins Restart
    echo -e "${colors[1]}jenkins Restart Başladı ... "
    docker container restart jenkins_container
}



########################################################################################################################################
########################################################################################################################################
jenkins_https() {
    # terminal Üzerinden Administrator password
    winpty docker exec -it jenkins_container bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"
    # Listelemek
    ls -al
    pwd
    sleep 2
    echo -e "\n###### ${HTTPS} ######  "
    read -p "Jenkins Https Yerine Http Yazabilir miyiz  ? e/h " httpResult
    if [[ $httpResult == "e" || $httpResult == "E" ]]; then
        echo -e "Https Dockerize Başladı ... "

        # Geriye Say
        ./countdown.sh

        # Geriye Say
        jenkins_count_down
        docker ps

        # (HTTPS) =>  (HTTP)
        # 1.YOL
        winpty docker exec -it jenkins_container bash -c "sed -i 's/https/http/g' /var/jenkins_home/hudson.model.UpdateCenter.xml"
        # 2.YOL
        # winpty docker exec -it jenkins_container bash
        # sed -i 's/https/http/g' /var/jenkins_home/hudson.model.UpdateCenter.xml
    else
        echo -e "Jenkins Https çalıştırılmadı ..."
    fi
}

########################################################################################################################################
########################################################################################################################################
jenkins_install() {
    # Jenkins adında bir container'ın oluşup oluşmadığını kontrol eden fonksiyon
    check_jenkins() {
        docker ps --filter "name=jenkins_container" --format "{{.Names}}" | grep -w "jenkins_container" >/dev/null
        return $?
    }

    # Jenkins container'ının kurulmasını bekle
    while ! check_jenkins; do
        echo "Jenkins container kurulmadı, bekleniyor..."
        sleep 5
    done

    # Count down
    jenkins_count_down

    # Jenkins container kurulduktan sonra docker ps komutunu çalıştır
    # echo "Jenkins container kuruldu, docker ps çalıştırılıyor."
    echo -e "${colors[3]}Jenkins container kuruldu, docker ps çalıştırılıyor\033[0m"
    docker ps
    docker logs jenkins_container
    winpty docker exec -it jenkins_container bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"
    winpty docker exec -it jenkins_container java -version

    # Https Çalışsın
    jenkins_https
    jenkins_count_down
    jenkins_restart
}

jenkins_install

########################################################################################################################################
########################################################################################################################################

