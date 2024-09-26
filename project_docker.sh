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
jenkins_count_down() {
    # 60'den aşağı say
    for ((i = 2; i >= 0; i--)); do
        color_index=$((i % ${#colors[@]}))                      # Renk dizisindeki sıraya göre renk seç
        echo -e "Kalan Zaman: ${colors[$color_index]}$i\033[0m" # Sayıyı seçilen renkte yazdır ve renk sıfırla
        sleep 1
    done
}

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
    docker version

    # Geriye Say
    ./countdown.sh

    docker search jenkins
    docker ps
    docker run -p 2225:8080 -p 50005:50000 --name docker_jenkins5 jenkins/jenkins
    winpty docker exec -it docker_jenkins bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"

}

project_version

########################################################################################################################################
########################################################################################################################################
jenkins_restart() {
    # Jenkins Restart
    echo -e "${colors[1]}jenkins Restart Başladı ... "
    docker container restart jenkins_container
}
