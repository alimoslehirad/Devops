# elk stack installatlion

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)



## centos intialization
 -  update &&  upgrade:
   ```sh
   yum update -y && yum upgrade -y
   ```
 - install necessary package 
   ```sh
   yum install vim net-tools link firewalld 
   ```
 - Install Java .
   ```sh
   yum -y install java-openjdk-devel java-openjdk
   ```
 - Add ELK repository
 ```sh
 cat <<EOF | sudo tee /etc/yum.repos.d/elasticsearch.repo
 [elasticsearch-7.x]
 name=Elasticsearch repository for 7.x packages
 baseurl=https://artifacts.elastic.co/packages/7.x/yum
 gpgcheck=1
 gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
 enabled=1
 autorefresh=1
 type=rpm-md
 EOF
 ```
- After adding the repo, import GPG key:
```sh
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
```
- Clear and update your YUM package index.
```sh
yum clean all && yum makecache
```
###Step 3: Install and Configure Elasticsearch
```sh
yum -y install elasticsearch
```
- Start and enable elasticsearch service on boot:
```sh
systemctl enable --now elasticsearch.service 
```


how to create user and password in passwd mode with and copy to nginx user
```sh
    echo "kibanaadmin:`openssl passwd -apr1`" | sudo tee -a /etc/nginx/htpasswd.users
```
Test to verify that it is working:
```sh
curl http://127.0.0.1:9200
```
###Step 4: Install and Configure Kibana
```sh
yum -y install kibana
```
```sh
vim /etc/kibana/kibana.yml
server.host: "0.0.0.0"
server.name: "kibana.example.com"
elasticsearch.url: "http://localhost:9200"
```

```sh
systemctl enable --now kibana
```
```sh
sudo firewall-cmd --add-port=5601/tcp --permanent
sudo firewall-cmd --reload
```

###Step 5: Install and Configure Logstash
- installation
```sh
yum -y install logstash
```
Logstash custom configurations can be placed under the /etc/logstash/conf.d/directory.


## host preparation
[plugins/onedrive/README.md][PlOd] |
| Medium | [plugins/medium/README.md][PlMe] |
| Google Analytics | [plugins/googleanalytics/README.md][PlGa] |
