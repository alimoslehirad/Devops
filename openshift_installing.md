# openshift 3.11 installation

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

all necessary documents exist in [openshift doc](https://docs.openshift.com/container-platform/3.11/welcome/index.html) in depth. but we explain this in abstract.
we have 4 important steps to create openshift cluster:
1. plan for your cluster structure
2. host preparation
3. create inventry file
4. deploy cluster

## plan for your cluster structure
in this example we deploy three host cluster one master and three node. master is also node. in very high availability mode, we must setup multi master.

## host preparation
  - Operating system requirements
    For servers that use x86_64 architecture, use a base installation of Red Hat Enterprise Linux (RHEL) 7.5 or later
  - Setting PATH
    add /bin, /sbin, /usr/bin, /usr/sbin to PATH variable in every hosts.
  - Ensuring host access
    master must have ssh root access to all nodes. Note to generate password less ssh key.
  - Setting proxy overrides
  - Registering hosts
  - Installing base packages
    install this packages on all hosts.
     ```sh
     yum install wget git net-tools bind-utils yum-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct
     yum update -y
     reboot
     ```
  - Installing Docker
    yum install docker-1.13.1 -y
    systemctl enable docker --now && systemctl status docker
  - Configuring Docker Storage
  - Configure proxy for docker 
    for pull images we need a proxy for docker in all hosts.
    ```sh
    vim /etc/systemd/system/docker.service.d/http-proxy.conf
    ```
    copy this lines on http-proxy.conf
   [Service]
   Environment="HTTP_PROXY=http://mp_proxy_user:pass@194.5.207.163:3128"
   Environment="NO_PROXY=localhost,127.0.0.0/8,10.0.0.0/8,192.168.0.0/16,172.16.0.0/12"
   
   then restart docker and check if proxy env added.
   
   ```sh
   $ systemctl show docker --property Environment
   ```
 - set hostname
 - set hosts
     ```sh
     $ vim /etc/hosts
     
     45.135.242.8  mocm.mparsict.com
     45.135.242.10 mocn1.mparsict.com
     45.135.242.13 mocn2.mparsict.com
     ```
   
 - configure dns 
     open this file vi /etc/NetworkManager/NetworkManager.conf, include contents
     ```sh
     [main]
     dns=none
     ```
     Modify ifconfig label information, and use google DNS
     ```sh
     vim /etc/sysconfig/network-scripts/ifcfg-device_name
     ```
     copy these lines 
     ```sh
     PEERDNS="no"
     DNS1="8.8.8.8"
     ```
     add google dns
     ```sh
     vim /etc/resolv.conf
     nameserver 8.8.8.8
     ```
     add google dns to for cluster DNS:
     in master:
     ```sh
     echo nameserver 8.8.8.8 >> /etc/origin/master/resolv.conf 
     ```
     in nodes:
     ```sh
     echo nameserver 8.8.8.8 >> /etc/origin/node/resolv.conf
     ```
     then restart Network manager in all hosts
     ```sh
     systemctl restart NetworkManager
     ```
 - create htpasswd file in master
   ```sh
   touch /etc/origin/master/htpasswd
   ```  
 - Red Hat Gluster Storage Software Requirements

## create inventry file   


## deploy cluster
For deploy cluster we must run two ansible playbooks prerequisites.yml and deploy_cluster.yml on the mater host.
Befor run these ansible play books we must download all ansible files from openshift github repo.
```sh
git clone https://github.com/openshift/openshift-ansible.git
cd openshift-ansible && git fetch && git checkout release-3.11 && git pull
```
 First do prerequest work:
 ```sh
 ansible-playbook -i inventory.ini playbooks/prerequisites.yml
 ```
 then this command deploy openshift cluster:
 ```sh
 ansible-playbook -i inventory.ini playbooks/deploy_cluster.yml
 ```
You can also:
  - Import and save files from GitHub, Dropbox, Google Drive and One Drive
  - Drag and drop markdown and HTML files into Dillinger
  - Export documents as Markdown, HTML and PDF

Markdown is a lightweight markup language based on the formatting conventions that people naturally use in email.  As [John Gruber] writes on the [Markdown site][df1]

> The overriding design goal for Markdown's
> formatting syntax is to make it as readable
> as possible. The idea is that a
> Markdown-formatted document should be
> publishable as-is, as plain text, without
> looking like it's been marked up with tags
> or formatting instructions.

This text you see here is *actually* written in Markdown! To get a feel for Markdown's syntax, type some text into the left window and watch the results in the right.

### Tech

Dillinger uses a number of open source projects to work properly:

* [AngularJS] - HTML enhanced for web apps!
* [Ace Editor] - awesome web-based text editor
* [markdown-it] - Markdown parser done right. Fast and easy to extend.
* [Twitter Bootstrap] - great UI boilerplate for modern web apps
* [node.js] - evented I/O for the backend
* [Express] - fast node.js network app framework [@tjholowaychuk]
* [Gulp] - the streaming build system
* [Breakdance](https://breakdance.github.io/breakdance/) - HTML to Markdown converter
* [jQuery] - duh

And of course Dillinger itself is open source with a [public repository][dill]
 on GitHub.

### Installation

Dillinger requires [Node.js](https://nodejs.org/) v4+ to run.

Install the dependencies and devDependencies and start the server.

```sh
$ cd dillinger
$ npm install -d
$ node app
```

For production environments...

```sh
$ npm install --production
$ NODE_ENV=production node app
```

### Plugins

Dillinger is currently extended with the following plugins. Instructions on how to use them in your own application are linked below.

| Plugin | README |
| ------ | ------ |
| Dropbox | [plugins/dropbox/README.md][PlDb] |
| GitHub | [plugins/github/README.md][PlGh] |
| Google Drive | [plugins/googledrive/README.md][PlGd] |
| OneDrive | [plugins/onedrive/README.md][PlOd] |
| Medium | [plugins/medium/README.md][PlMe] |
| Google Analytics | [plugins/googleanalytics/README.md][PlGa] |


### Development

Want to contribute? Great!

Dillinger uses Gulp + Webpack for fast developing.
Make a change in your file and instantaneously see your updates!

Open your favorite Terminal and run these commands.

First Tab:
```sh
$ node app
```

Second Tab:
```sh
$ gulp watch
```

(optional) Third:
```sh
$ karma test
```
#### Building for source
For production release:
```sh
$ gulp build --prod
```
Generating pre-built zip archives for distribution:
```sh
$ gulp build dist --prod
```
### Docker
Dillinger is very easy to install and deploy in a Docker container.

By default, the Docker will expose port 8080, so change this within the Dockerfile if necessary. When ready, simply use the Dockerfile to build the image.

```sh
cd dillinger
docker build -t joemccann/dillinger:${package.json.version} .
```
This will create the dillinger image and pull in the necessary dependencies. Be sure to swap out `${package.json.version}` with the actual version of Dillinger.

Once done, run the Docker image and map the port to whatever you wish on your host. In this example, we simply map port 8000 of the host to port 8080 of the Docker (or whatever port was exposed in the Dockerfile):

```sh
docker run -d -p 8000:8080 --restart="always" <youruser>/dillinger:${package.json.version}
```

Verify the deployment by navigating to your server address in your preferred browser.

```sh
127.0.0.1:8000
```

#### Kubernetes + Google Cloud

See [KUBERNETES.md](https://github.com/joemccann/dillinger/blob/master/KUBERNETES.md)


### Todos

 - Write MORE Tests
 - Add Night Mode

License
----

MIT


**Free Software, Hell Yeah!**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [dill]: <https://github.com/joemccann/dillinger>
   [git-repo-url]: <https://github.com/joemccann/dillinger.git>
   [john gruber]: <http://daringfireball.net>
   [df1]: <http://daringfireball.net/projects/markdown/>
   [markdown-it]: <https://github.com/markdown-it/markdown-it>
   [Ace Editor]: <http://ace.ajax.org>
   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [jQuery]: <http://jquery.com>
   [@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>

   [PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
   [PlGh]: <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
   [PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
   [PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
   [PlMe]: <https://github.com/joemccann/dillinger/tree/master/plugins/medium/README.md>
   [PlGa]: <https://github.com/RahulHP/dillinger/blob/master/plugins/googleanalytics/README.md>
