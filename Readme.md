# Workshop  Jenkins
[GitHub](https://github.com/hamitmizrak/Workshop-Jenkins-Dockerfile-Docker)
[Jenkins Resmi Sitesi](https://www.jenkins.io/)
[Jenkins Pipeline Document](https://www.jenkins.io/doc/book/pipeline/)
--- 


## Git
```sh
git init
git add . (Staged Area Taşıyacak)
git commit -m "Jenkins Readme"
git branch -b "main"
git remote add aliasRemoteName
git remote
git push -u origin master

```
---


## Git Sıklıkla Kullanılan Komutlar
```sh
git status
git logs

```
---


## CI/CD
```sh
CI: Continous Integration(Sürekli Teslimat):  
Projede öncelikle bir derleme(Compiler) yapılır.
Sonrasında Test(Unit Test)
Bu iki adımı Compiler,Test eğer başarılı ise CD kısmına geçecektir. 
Eğer bu iki adımdan yani, Compiler veya Test başarılı değilse CD tarafına geçilmez.

CD:  Continuous Delivery  ve Continuous Deployment
Eğer CI tarafı başarılı(success) ise CD tarafı başlayacaktır.
Eğer herşey otomatik olmasını istiyorsak => Continuous Deployment
Eğer onay mekanizması(manuel) olmasını istiyorsak => Continuous Delivery
```
---


## Jenkins & GitLab
```sh
Jenkins: 
Ücretsizdir
Açık Kaynak kodludur. 
Çok popüler bir CI araçıdır. 
Öğrenme Eğrisi Diktir  
Çok fazla pluginler vardır

GitLab:
Ücretsizdir ancak ücretli versiyonuda vardır.
Bir CI araçıdır.
Öğrenme Eğrisi kolaydır  
Çok fazla pluginler yoktur
```
---


## Jenkins Nedir ?
```sh
Java ile yazılmıştır. Dikkat JDK-8 veya JDK-11 kullanın son sürümlerde çalışmıyooooorrrr
Ücretsizdir
Cross platform(Farklı işletim sistemlerinden de kullanılır.)
Açık Kaynak kodludur. 
Çok popüler bir CI araçıdır. 
Öğrenme Eğrisi Diktir  
Çok fazla pluginler vardır.
Tekrarlanan görevlerin otomatik çalışmasını sağlamak için gerekli bir Devops CI araçıdır.
Proje kodlarımızdaki hataları hızlıca bulup çözmek
Zamandan tasarruf sağlamak => Zaman maliyeti en az indirgemek
Jenkinsde öğrenme eğrisi diktir.
Yaklaşık +500 fazla plugini vardır.
Sadece CI ile ilgilenmez Aynı zamanda CD tarafından çalışmaktadır. 
Jenkins işlerini yürütürken Grovy ile yazılan görevler(task) belirleriz.
Not: Docker işlerini yürütürken YAML dosyası ile Servislerimizi(Dockerfile,docker-compose.yml) ile yaparız.
```
---

## Jenkins Doğuşunu
```sh
2005 yılında Sun Microsystem firmasında(Java'nın kurucu firması) çalışan birisi HUDSON isimli bir CI araçı geliştiriyor.

2009 yılında Oracle sun Microsystem firmasını satın alıyor ve Anlaşmazlıkla meydana geliyor Hudson isimli projeyi yazan kişi kaynak kodları alıyor ve buna JENKINS diyor.
```
---


## Jenkins Amaçı
```sh
Projeyi Derlemek(Compiler)
Otomatik Testler yapmak
Statik kod analizi yapmak(SonarQube)
Teslimat(Depyloment)
Ekip çalışanlarımızı bu konularla haberdar etmek
Maven,SonarQube,Docker,K8S
```
---

## Jenkins Çalışma Prensibi
Jenkins'in çalışma prensibi, temel olarak yazılım geliştirme süreçlerinde otomasyon sağlamak için işlerin (jobs) tanımlanması, 
bu işlerin belirlenen zamanlarda veya olay tetikleyicileri ile çalıştırılması, işler sonucunda çıktıların toplanması ve 
bu çıktılar doğrultusunda kararlar alınması esasına dayanır. Jenkins'in çalışma prensibi çeşitli adımlar ve bileşenlerle açıklanabilir:

### 1. **Master-Agent Mimarisi**
Jenkins'in temel yapısı **master-agent** mimarisi üzerine kuruludur. Bu mimari, Jenkins'in ölçeklenebilir ve dağıtık çalışmasını sağlar. 
Temel olarak iki bileşen vardır:

- **Master Sunucu:** Jenkins'in ana bileşenidir. Jenkins Master, kullanıcı arayüzünü sunar, işleri zamanlar ve çalıştırılacak işlerin komutlarını Agent sunuculara gönderir. 
- Jenkins Master, ayrıca tüm yapılandırmaların ve işlerin yönetiminden sorumludur.
  
- **Agent Sunucular (Nodes):** Agent sunucular, Jenkins Master tarafından yönetilen işlerin çalıştırıldığı sunuculardır. 
- Bir Jenkins ortamında birden fazla Agent olabilir ve bu sayede iş yükü dağıtılabilir, işleri paralel olarak çalıştırmak mümkün olur. 
- Her Agent, kendi ortamına sahip olabilir ve bağımsız bir şekilde iş yapabilir.

#### Çalışma Süreci:
1. **Master**, hangi işlerin çalıştırılacağına karar verir.
2. **Agent**, bu işleri alır ve belirtilen sırayla adımları gerçekleştirir.
3. **Master**, agent tarafından dönen sonuçları toplar ve raporlar.

### 2. **Job (İş) Yönetimi**
Jenkins'te işler (jobs), belirli görevlerin gerçekleştirildiği birimleri temsil eder. Bir Jenkins işinde genellikle şu adımlar yer alır:
- **Kodun alınması (Checkout)**: Kaynak kodunun sürüm kontrol sistemlerinden (Git, SVN vb.) çekilmesi.
- **Kodun derlenmesi (Build)**: Çekilen kodun derlenmesi, genellikle Maven, Gradle gibi araçlar kullanılarak gerçekleştirilir.
- **Test**: Derlenen kodun birim ve entegrasyon testlerinin yapılması.
- **Dağıtım (Deploy)**: Kodun ilgili ortamlara (test, staging, üretim) dağıtılması.

### 3. **Pipeline (Boru Hattı) Mantığı**
Bir Jenkins pipeline'ı, bir yazılım teslimat sürecini uçtan uca tanımlayan bir dizi adımdır. Pipeline'lar, işlerin nasıl çalıştırılacağını ve hangi sırayla gerçekleşeceğini belirler. 
Pipeline yapısı iki şekilde olabilir:

- **Declarative Pipeline:** Basit bir DSL (Domain Specific Language) kullanarak CI/CD süreçlerini tanımlar. 
- Kullanımı kolaydır ve yapılandırılmış bir model sunar.
- **Scripted Pipeline:** Daha esnek bir yapı sunan, Groovy dili ile yazılan bir pipeline türüdür.

Pipeline süreçleri tipik olarak şu aşamalardan geçer:
- **Build**: Kodun derlenmesi.
- **Test**: Birim testleri ve entegrasyon testlerinin çalıştırılması.
- **Deploy**: Yazılımın bir ortama dağıtılması (test, staging veya production).

Jenkins Pipeline, Jenkinsfile ile tanımlanır ve sürüm kontrol sistemlerinde depolanabilir.

### 4. **Tetikleyiciler (Triggers)**
Jenkins işleri genellikle belirli bir olay veya zaman ile tetiklenir. Jenkins, işlerin otomatik olarak çalıştırılabilmesi için çeşitli tetikleyici mekanizmalar sunar:

- **Zamanlayıcı (Cron Tabanlı):** İşlerin belirli zaman aralıklarında çalıştırılması için zamanlanmış görevler kullanılır.
  Örneğin: Her gün saat 02:00'de işin çalıştırılması.
  
- **Webhook Tetikleyicileri:** GitHub, GitLab gibi sürüm kontrol sistemleri ile entegrasyonlar sayesinde kodda yapılan her değişiklikte işin tetiklenmesi sağlanabilir. Bu özellikle sürekli entegrasyon (CI) süreçleri için önemlidir.
  
- **Manuel Tetikleme:** Kullanıcılar, Jenkins kullanıcı arayüzünden bir işin manuel olarak çalıştırılmasını sağlayabilir.

### 5. **Jenkinsfile**
Jenkinsfile, Jenkins Pipeline'ların kodlanarak sürüm kontrol sistemlerinde saklanmasını sağlayan bir dosya formatıdır. 
Bu dosya, CI/CD süreçlerini tanımlayan kodları içerir ve pipeline süreçlerinin versiyonlanabilir olmasını sağlar.

Örneğin bir Jenkinsfile şu şekilde olabilir:
```groovy
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/kullanici/proje.git'
            }
        }
        stage('Build') {
            steps {
                sh 'make build'
            }
        }
        stage('Test') {
            steps {
                sh 'make test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'make deploy'
            }
        }
    }
}
```
Bu Jenkinsfile, kodun alınmasından test edilmesine ve dağıtılmasına kadar bir dizi işlemi tanımlar.

### 6. **Eklentiler (Plugins)**
Jenkins, çok geniş bir eklenti ekosistemine sahiptir. 
Bu eklentiler, Jenkins'in farklı yazılım geliştirme araçları ile entegrasyonunu sağlar. Örneğin:
- **Git Eklentisi**: Jenkins'in Git ile çalışmasını sağlar.
- **Maven Eklentisi**: Jenkins'te Maven projelerinin derlenmesini kolaylaştırır.
- **Docker Eklentisi**: Jenkins'in işlerini Docker konteynerleri içinde çalıştırmasını sağlar.

Eklentiler, Jenkins'in esnekliğini artırır ve özel ihtiyaçlara göre uyarlanabilir.

### 7. **Sonuçların Raporlanması ve İzlenmesi**
Jenkins, işlerin sonunda çıktıları toplar ve bunları raporlar. 
Bu sonuçlar, Jenkins kullanıcı arayüzünden izlenebilir ve analiz edilebilir. 
Başarılı veya başarısız işlerin sonuçları, test raporları ve dağıtım durumu gibi bilgileri içerir. 
Jenkins ayrıca üçüncü parti araçlar ile entegrasyon sağlayarak (örneğin Slack, JIRA, email) sonuçların bildirilmesini sağlar.

### 8. **Paralel Çalıştırma**
Jenkins Pipeline, aynı anda birden fazla işin paralel olarak çalıştırılmasına olanak tanır. 
Bu özellik, büyük projelerde işlerin daha hızlı tamamlanmasını sağlar. 
Örneğin birden fazla testin paralel çalıştırılması, yazılımın test edilme süresini büyük ölçüde kısaltabilir.

Örnek paralel çalışma:
```groovy
pipeline {
    agent any
    stages {
        stage('Parallel Tests') {
            parallel {
                stage('Test 1') {
                    steps {
                        sh 'run test1'
                    }
                }
                stage('Test 2') {
                    steps {
                        sh 'run test2'
                    }
                }
            }
        }
    }
}
```

### 9. **Sonuç Yönetimi**
Jenkins, her çalıştırılan işten dönen sonuçları saklar ve raporlar oluşturur. Sonuçlar şu şekillerde olabilir:
- **Başarılı (Success):** Tüm adımlar sorunsuz tamamlandıysa iş başarılı olur.
- **Başarısız (Failure):** Herhangi bir adımda hata olursa iş başarısız olur.
- **Unstable (Kararsız):** Testler sırasında bazı hatalar bulunmuş ancak derleme başarılı olmuştur.
- **Aborted (Durduruldu):** İş manuel olarak durdurulmuş olabilir.

### 10. **Kapasite ve Performans Yönetimi**
Jenkins, büyük projelerde paralel işlerin yürütülmesine olanak tanıdığı için, geniş bir sunucu ağına ölçeklenebilir. 
Birden fazla **agent** kullanılarak, iş yükü dağıtılır ve işler daha hızlı tamamlanır. 
Bu dağıtık yapı, Jenkins'in büyük ölçekli yazılım projelerinde kullanılabilirliğini artırır.

### Sonuç
Jenkins, esnek ve güçlü bir otomasyon aracıdır. 
İşlerin tanımlanması, tetiklenmesi ve sonuçların raporlanması üzerine kurulmuş bir mimari ile çalışan Jenkins, özellikle CI/CD süreçlerinde yaygın olarak kullanılır. 
Master-agent mimarisi ile dağıtık çalışma imkanı sunarken, pipeline yapısı ile iş süreçlerinin tanımlanmasını kolaylaştırır. 
Eklenti desteği sayesinde ise farklı yazılım araçları ile entegrasyon sağlanır ve iş akışları otomatize edilir.

---
## Jenkins Kavramları
Jenkins, yazılım geliştirme süreçlerinde otomatikleştirme ve sürekli entegrasyon/sürekli teslimat (CI/CD) için kullanılan popüler bir açık kaynaklı araçtır. 
Jenkins, özellikle devops uygulamalarında yazılımın daha hızlı, güvenilir ve hatasız teslim edilmesine yardımcı olmak için geniş bir eklenti desteği sunar. 
Jenkins'i ayrıntılı olarak anlamak için önemli kavramlarını ve özelliklerini şu başlıklar altında inceleyebiliriz:

### 1. **Jenkins Pipeline (Jenkins Boru Hattı)**
Jenkins Pipeline, yazılım teslimatının tam otomatik bir sürecini tanımlayan bir dizi adımdan oluşur. 
Pipeline'lar genellikle kodu derlemek, test etmek, dağıtmak gibi adımları içerir. Jenkins Pipeline, Jenkinsfile adı verilen bir dosyada kodlanabilir. İki tür pipeline vardır:
- **Declarative Pipeline (Deklaratif Boru Hattı)**: Kullanımı daha basit ve yapılandırılmış bir biçimde CI/CD sürecini tanımlar.
- **Scripted Pipeline (Betik Boru Hattı)**: Daha fazla esneklik sağlar ve Groovy dilinde yazılır, ancak karmaşıktır.

#### Örnek Jenkinsfile (Deklaratif Pipeline)
```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'make build'
            }
        }
        stage('Test') {
            steps {
                sh 'make test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'make deploy'
            }
        }
    }
}
```

### 2. **Agent (Ajan)**
Agent, bir Jenkins görevinin hangi ortamda çalıştırılacağını belirtir. 
Jenkins master sunucusu genellikle işleri kontrol eder, ancak görevleri farklı agent sunucularda (node'larda) çalıştırabilir. 
Pipeline'da "agent any" olarak belirtilen bölüm, işin herhangi bir mevcut ajan üzerinde çalıştırılabileceğini ifade eder.

### 3. **Stages (Aşamalar)**
Pipeline içerisinde her bir adım **stage** ile tanımlanır. Her aşama bir adımdan oluşur ve farklı görevler yapabilir, 
örneğin: derleme, test etme, dağıtım gibi aşamalar olabilir. 
Aşamalar, Jenkins'te görsel olarak ayrıntılı bir şekilde izlenebilir ve her aşama farklı agent'larda çalışabilir.

### 4. **Steps (Adımlar)**
Her bir **stage** içerisinde spesifik adımlar bulunur. 
Örneğin, 'sh' komutu kullanılarak kabuk betikleri çalıştırılabilir ya da başka bir komut çağrılabilir. 
Jenkins adımları, belirli görevleri gerçekleştiren atomik işlemler olarak düşünülebilir.

### 5. **Jenkins Master ve Agent Mimarisi**
Jenkins, master-agent mimarisi ile çalışır. **Master** sunucu, Jenkins işlerinin zamanlanmasını ve yönetilmesini sağlar. 
**Agent** sunucular ise bu işlerin çalıştırıldığı sunuculardır. 
Bu mimari sayesinde Jenkins, iş yükünü birden fazla sunucuya dağıtarak ölçeklenebilir.

### 6. **Jenkins Plugins (Eklentiler)**
Jenkins'in en güçlü özelliklerinden biri, yüzlerce üçüncü parti eklentiyi desteklemesidir. 
Eklentiler, Jenkins'in entegrasyon kabiliyetini artırır ve farklı araçlarla uyumlu çalışmasını sağlar. 
Örneğin, Git, Docker, Maven, Gradle, Slack gibi araçlarla entegrasyon sağlayan eklentiler mevcuttur.

### 7. **Jenkins Nodes (Düğümler)**
**Node** (düğüm), Jenkins'in işler için kullanabileceği bir sistemdir. 
Master sunucusu bir node olabilir ya da uzak bir agent bir node olarak tanımlanabilir. 
Jenkins, büyük projelerde paralel işlerin yürütülebilmesi için birden fazla node kullanabilir.

### 8. **Blue Ocean (Mavi Okyanus)**
Blue Ocean, Jenkins Pipeline'ları daha görsel ve kullanıcı dostu bir arayüzle yönetmek için geliştirilmiş bir eklentidir. 
Jenkins Pipeline iş akışlarını görsel olarak daha kolay takip etme imkanı sunar ve hata ayıklama sürecini hızlandırır.

### 9. **Jenkins Multibranch Pipeline (Çoklu Dal Boru Hattı)**
Multibranch Pipeline, farklı git dalları için ayrı ayrı pipeline tanımlama imkanı sunar. 
Özellikle feature branch'ler üzerinde çalışan projelerde her bir dal için farklı bir pipeline tanımlanabilir ve dallar arası otomasyon sağlanabilir.

### 10. **Freestyle Project (Serbest Proje)**
Jenkins'te en basit iş türü, **Freestyle Project** olarak bilinir. 
Bu iş tipi, genellikle basit derleme ve test işlemleri için kullanılır. 
Boru hattı yerine klasik yapılandırmaya dayalıdır. 
Freestyle işlerde elle yapılandırılan görevler, pipeline kadar esnek ve kodlanabilir değildir.

### 11. **CI/CD (Sürekli Entegrasyon/Sürekli Teslimat)**
Jenkins'in en yaygın kullanım alanlarından biri sürekli entegrasyon (CI) ve sürekli teslimat (CD) süreçlerinin otomatize edilmesidir. 
CI, geliştiricilerin kod değişikliklerini sürekli olarak entegre etmesine ve her değişikliğin otomatik olarak test edilmesine olanak tanır. 
CD ise başarılı testlerden sonra kodun otomatik olarak hedef ortama (örn. üretim ortamına) dağıtımını sağlar.

### 12. **Jenkins Eklentileri ile Docker Entegrasyonu**
Jenkins, Docker ile mükemmel bir uyum içerisinde çalışabilir. 
Jenkins'in Docker eklentisi, Jenkins işlerini Docker konteynerlerinde çalıştırmayı sağlar. 
Bu, izole ve taşınabilir bir ortam sunarak, bağımlılık problemlerinin ortadan kalkmasına yardımcı olur.

#### Örnek Docker Entegrasyonu ile Jenkins Pipeline:
```groovy
pipeline {
    agent {
        docker {
            image 'maven:3.8.1-jdk-11'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
    }
}
```

### 13. **Jenkins Credentials (Kimlik Bilgileri Yönetimi)**
Jenkins'te kimlik bilgileri yönetimi, gizli anahtarlar, 
kullanıcı adı ve şifre gibi hassas verileri güvenli bir şekilde depolamaya ve kullanmaya olanak tanır. 
Kimlik bilgileri, özellikle CI/CD sürecinde uzak sunuculara erişim sağlamak veya veri tabanlarına bağlantı kurmak gibi senaryolarda kullanılır.

### 14. **Jenkinsfile**
Jenkinsfile, Jenkins Pipeline'ı kodlamak için kullanılan bir dosyadır. 
Jenkinsfile, Pipeline tanımını saklayan bir dosya olduğu için sürüm kontrol sistemine dahil edilebilir ve bu da CI/CD süreçlerini daha izlenebilir hale getirir. 
Kod tabanında yapılan değişikliklerle birlikte pipeline'ların da kolayca güncellenmesini sağlar.

### 15. **Parallel Execution (Paralel Yürütme)**
Jenkins Pipeline, görevlerin paralel olarak çalıştırılmasına olanak tanır. 
Bu özellik, büyük projelerde aynı anda birden fazla görevin çalıştırılması gereken durumlarda kullanılır ve iş süreçlerini hızlandırır.

#### Örnek Paralel Adımlar:
```groovy
pipeline {
    agent any
    stages {
        stage('Parallel Execution') {
            parallel {
                stage('Test 1') {
                    steps {
                        sh 'echo "Running Test 1"'
                    }
                }
                stage('Test 2') {
                    steps {
                        sh 'echo "Running Test 2"'
                    }
                }
            }
        }
    }
}
```

### Sonuç
Jenkins, modern yazılım geliştirme süreçlerinde yaygın olarak kullanılan bir otomasyon aracıdır. 
Jenkins'in boru hattı yapısı, eklenti desteği ve Docker ile entegrasyonu gibi özellikler, Jenkins'i çok yönlü ve esnek bir araç haline getirir. 
Jenkins'in master-agent mimarisi, büyük projelerde dağıtık sistemlerde ölçeklenebilir işlerin yürütülmesine olanak tanır. 
CI/CD sürecini otomatize ederek yazılım geliştirme süreçlerini hızlandırır ve daha az hatayla üretime geçilmesine yardımcı olur.
---


## Jenkins Windows Kurulumları
```sh
DİKKATTTT: Jenkins kurulmadan önce bilgisayarımızda kurmamız gerekenler
1-) Git (git -v)
2-) Maven (mvn -v)
3-) JDK11 (java --version)
4-) Docker (docker version)
DİKKATTTT::: Jenkins'i yukarıdakiler kuruluysa, jenkins'i kurmalıyım.
```
---


## Windows Jenkins Kurulumu 
```sh
https://www.jenkins.io/download/

Git => https://git-scm.com/downloads

Docker Desktop Wind11 => https://docs.docker.com/desktop/install/windows-install/

Jenkins Windows indir => https://www.jenkins.io/download/thank-you-downloading-windows-installer-stable/

JDK 11 => C:\Program Files\Java\jdk-11.0.16.1\
Administrator password => C:\ProgramData\Jenkins\.jenkins\secrets\initialAdminPassword
cat C:\ProgramData\Jenkins\.jenkins\secrets\initialAdminPassword
5d92b17c5714434389bfc1826fa66758

Maven => https://maven.apache.org/download.cgi

http://lcoalhost:9999
username: admin
password: adminadmin
```
---

## Windows Jenkins Path 
```sh
http://localhost:9999/manage/configureTools/

GİT
version: git -v
name: Git_Workshop
path: C:\Program Files\Git\bin\git.exe


JDK
version: java --version
name: JDK11_Workshop
path: C:\Program Files\Java\jdk-11.0.16.1


MAVEN
version: mvn -v
name: Maven_Workshop
path: D:\1_Kodlar\maven\apache-maven-3.9.8

DOCKER
version: docker version
```
---


## Windows Jenkins Plugin 
```sh
http://localhost:9999/manage/configureTools/

GİTHUB
version: git -v
Plugin Name: GitHub Integration Plugin


JDK
version: java --version
Plugin Name: Oracle Java SE Development Kit Installer Plugin 


MAVEN
version: mvn -v
Plugin Name: Maven Integration plugin


DOCKER
version: docker version
Plugin Name: Docker plugin
```
---



## Jenkins Docker Kurulumları
```sh
DİKKATTTT: Jenkins kurulmadan önce bilgisayarımızda kurmamız gerekenler
DİKKATTTT: Jenkins kurulmadan önce bilgisayarımızda kurmamız gerekenler
1-) Git (git -v)
2-) Maven (mvn -v)
3-) JDK11 (java --version)
4-) Docker (docker version)
DİKKATTTT::: Jenkins'i yukarıdakiler kuruluysa, jenkins'i kurmalıyım.
```
---


## Docker Üzerinden Jenkins Kurulumu (1.YOL)
```sh
docker version
docker search jenkins
docker pull jenkins/jenkins:lts-jdk11
docker pull jenkins/jenkins:lts-jdk17

docker container run -d --name docker_jenkins  -p 8888:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk11
docker container run -d --name docker_jenkins --dns 8.8.8.8 --dns 8.8.4.4  -p 8888:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk11

docker container run -d --name docker_jenkins  -p 8888:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk17
docker container run -d --name docker_jenkins --dns 8.8.8.8 --dns 8.8.4.4  -p 8888:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk17

docker ps 
docker ps -a
docker container ls
docker container ls -a
winpty docker exec -it docker_jenkins java -version

docker logs docker_jenkins
winpty docker exec -it docker_jenkins bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"
Administrator password: 
c7d6c30b5ca74c0abc812a0fbeb46c05

**Offline This Jenkins instance appears to be offline.**
DİKKKATTTT : Eğer Yukarıdaki Hata geliyorsa terminalde şunları yapıyorum.

# 1.YOL (HTTP)
winpty docker exec -it docker_jenkins bash  -c "cat /var/jenkins_home/hudson.model.UpdateCenter.xml"
<sites>
  <site>
    <id>default</id>
    <url>https://updates.jenkins.io/update-center.json</url>
  </site>
</sites>


winpty docker exec -it docker_jenkins bash  -c "cat > /var/jenkins_home/hudson.model.UpdateCenter.xml"
<sites>
  <site>
    <id>default</id>
    <url>http://updates.jenkins.io/update-center.json</url>
  </site>
</sites>

winpty docker exec -it docker_jenkins bash  -c "cat /var/jenkins_home/hudson.model.UpdateCenter.xml"
docker container restart docker_jenkins
winpty docker exec -it docker_jenkins bash  -c "cat /var/jenkins_home/hudson.model.UpdateCenter.xml"
http://localhost:8888/

docker ps 
docker container --help
docker container restart containerID
docker container restart containerNAME
docker container restart docker_jenkins
docker container stop docker_jenkins
docker container start docker_jenkins

http://localhost:9999
username: admin
password: adminadmin
```
---


## Docker Üzerinden Jenkins Kurulumu (2.YOL)
```sh
docker version
docker search jenkins
docker pull jenkins/jenkins:lts-jdk11
docker pull jenkins/jenkins:lts-jdk17

docker container run -d --name docker_jenkins  -p 8888:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk11
docker container run -d --name docker_jenkins --dns 8.8.8.8 --dns 8.8.4.4  -p 8888:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk11

docker container run -d --name docker_jenkins  -p 8888:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk17
docker container run -d --name docker_jenkins --dns 8.8.8.8 --dns 8.8.4.4  -p 8888:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk17

# terminal Üzerinden Administrator password
winpty docker exec -it docker_jenkins bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"

# (HTTPS) =>  (HTTP)
winpty docker exec -it docker_jenkins bash -c "sed -i 's/https/http/g' /var/jenkins_home/hudson.model.UpdateCenter.xml"
sed -i 's/https/http/g' /var/jenkins_home/hudson.model.UpdateCenter.xml 

docker ps 
docker ps -a
docker container ls
docker container ls -a
winpty docker exec -it docker_jenkins java -version

docker logs docker_jenkins
winpty docker exec -it docker_jenkins bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"
Administrator password: 
b15bf732fe73439caa07cd5089746dc7

winpty docker exec -it docker_jenkins bash  -c "cat /var/jenkins_home/hudson.model.UpdateCenter.xml"
docker container restart docker_jenkins

http://localhost:8888/

docker ps 
docker container --help
docker container restart containerID
docker container restart containerNAME
docker container restart docker_jenkins

docker container stop docker_jenkins
docker container start docker_jenkins

http://localhost:9999
username: admin
password: adminadmin
```
---


## Docker Üzerinden Jenkins Path 
```sh
http://localhost:9999/manage/configureTools/

GİT
version: git -v
name: Git_Workshop
path: C:\Program Files\Git\bin\git.exe


JDK
version: java --version
name: JDK11_Workshop
path: C:\Program Files\Java\jdk-11.0.16.1


MAVEN
version: mvn -v
name: Maven_Workshop
path: D:\1_Kodlar\maven\apache-maven-3.9.8

DOCKER
version: docker version
Plugin Name: Docker plugin
```
---


## Docker Üzerinden Jenkins Plugin 
```sh
http://localhost:9999/manage/configureTools/

GİTHUB
version: git -v
Plugin Name: GitHub Integration Plugin


JDK
version: java --version
Plugin Name: Oracle Java SE Development Kit Installer Plugin 


MAVEN
version: mvn -v
Plugin Name: Maven Integration plugin
Version3.23
```
---



## Jenkinsfile GitHub Pulling (Public)
```sh
GitHub Adres: https://github.com/hamitmizrak/Workshop-Jenkins-Dockerfile-Docker
Branch      : main

FreeStyle

```
---


## Jenkinsfile GitHub Pulling (Private)
```sh
Jenkins Private Project 
GitHub Adres: https://github.com/hamitmizrak/icisleri_private
Branch Name:  main

```
---


## Jenkins
```sh

```
---


## Jenkins
```sh

```
---


## Jenkins
```sh

```
---


## Jenkins
```sh

```
---


## Jenkins
```sh

```
---


## Jenkins
```sh

```
---


## Jenkins
```sh

```
---


## Jenkins
```sh

```
---


## Jenkins
```sh

```
---


## Jenkins
```sh

```
---


## Jenkins
```sh

```
---


## Jenkins
```sh

```
---


## Jenkins
```sh

```
---


## Jenkins
```sh

```
---


## Jenkins
```sh

```
---


## Jenkins
```sh

```
---


## Jenkins
```sh

```
---


## Jenkins
```sh

```
---

