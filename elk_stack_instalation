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

how to create user and password in passwd mode with and copy to nginx user
```sh
    echo "kibanaadmin:`openssl passwd -apr1`" | sudo tee -a /etc/nginx/htpasswd.users
```

## host preparation
[plugins/onedrive/README.md][PlOd] |
| Medium | [plugins/medium/README.md][PlMe] |
| Google Analytics | [plugins/googleanalytics/README.md][PlGa] |
