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

## Jenkins Kurulumları
```sh
DİKKATTTT: Jenkins kurulmadan önce bilgisayarımızda kurmamız gerekenler
1-) Git (git -v)
2-) Maven (mvn -v)
3-) JDK8 veya JDK11 (java --version)
4-) Jenkins'i yukarıdakiler kuruluysa, jenkins'i kurmalıyım.


```
---


## Windows Jenkins Kurulumu 
```sh
https://www.jenkins.io/download/

Windows indir => https://www.jenkins.io/download/thank-you-downloading-windows-installer-stable/

JDK 11 => C:\Program Files\Java\jdk-11.0.16.1\
Administrator password => C:\ProgramData\Jenkins\.jenkins\secrets\initialAdminPassword
cat C:\ProgramData\Jenkins\.jenkins\secrets\initialAdminPassword
5d92b17c5714434389bfc1826fa66758

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
Version3.23
```
---


## Linux(Ubuntu) Jenkins Kurulumu 
```sh

```
---


## Docker Pulling Jenkins
```sh

```
---


## Docker, Dockerfile, docker-compose.yml Jenkins
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

