guide : in this link doc number of '*' show importance degree of doc 

**cluster Monitoring of Toman**

[prometheus]: https://www.howtoforge.com/tutorial/monitor-ubuntu-server-with-prometheus/

 
grafana install link: http://docs.grafana.org/installation/debian/
Alertmanager: https://petargitnik.github.io/blog/2018/01/03/how-to-install-alertmanager-on-ubuntu-16.04
use 'dd if=/dev/zero of=/dev/null' command for make 100% usage of one core of cpu
alertmanager Doc:https://kjanshair.github.io/2018/07/26/prometheus-alert-manager/
prometheus Doc: https://kjanshair.github.io/2018/02/20/prometheus-monitoring/
grafana full nodeExporter dashboard in diffrent platform: https://grafana.com/dashboards/1860/revisions
 install node_exporter guide_link:https://devopscube.com/monitor-linux-servers-prometheus-node-exporter/
promotheus on kubenetes guide link: https://devopscube.com/setup-prometheus-monitoring-on-kubernetes/
slack alert Doc:https://api.slack.com/incoming-webhooks

The ultimate guide of prometheus on kubernetes is in this link: https://sysdig.com/blog/kubernetes-monitoring-prometheus/

kubernetes API refrrence: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#_v1_container
kubernetes yaml abstract tutorial: https://www.mirantis.com/blog/introduction-to-yaml-creating-a-kubernetes-deployment

daemonset vs deployment: https://stackoverflow.com/questions/53888389/difference-between-daemonsets-and-deployments
document for ssl/tls connection in ingress : https://www.thenativeweb.io/blog/2018-07-03-16-17-kubernetes-using-ingress-with-ssl-tls-termination-and-http2/


benefit general command :
-----------------------------------------------------------------------------commands-------------------------------------------------
----ISO file ------
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/anaconda_customization_guide/sect-iso-images
#mount -t iso9660 -o loop /home/alimoslehirad/Downloads/CentOS-7-x86_64-DVD-1908.iso /mnt/home/ali/customizeIso/geniso
#cp -pRf /mnt/home/ali/customizeIso/geniso/ /mnt/tmp/ISO/
----kubectl-------
kubectl -n monitoring    logs -f    prometheus-k8s-0 prometheus
 grep -rnw . -e 'node-exporter'     -- search inside of files
kubectl -n monitoring exec -it prometheus-k8s-1 sh
or
kubectl -nmonitoring exec -ti prometheus-k8s-1 /bin/sh
copy file from pod to local host directory: kubectl cp monitoring/prometheus-k8s-1:/prometheus/wal/00000000 /tmp/test
du -sh dir # compute size of directory
kube cluster average cpu usage query: 100 - (avg by (instance) (irate(node_cpu_seconds_total{job="node-exporter",mode="idle"}[5m])) * 100)
 kubectl -n monitoring create secret generic kube-etcd-client-certs --from-file=ca.crt=ca.pem --from-file=tls.crt=member-node1.pem --from-file=tls.key= member-node1-key.pem
kubectl port-forward prometheus-deployment-767978f966-8lg74 8080:9090 -n monitoring
how to see live log in from end:
kubectl -n toman-staging-dev log -f toman-staging-dev-79df7bb99d-2rk4d --tail=0   
 sed -n '38,40p' /var/log/dpkg.log   # show line range
sed ‘s/y/Y/g’ ahappychild.txt > ahappychild2.txt # replacement in a file in vim replace by this method too
sed '20,35d' myfile.txt # show entire file except given range 
sed 's/version/story/gi' myfile.txt  # replacement with ignore character case
awk -F " " '{print $4}'  # how to split text in colume mode
grep -n linuxtechi /etc/passwd # search specific pattern by show line
grep bash$ /etc/passwd   # display all line end by specific pattern   
cp x /dir/ --progress-bar # advance copy 
cat /sys/block/sda/queue/rotational   # how to know hard type 
du -h --max-depth=1  #how to determine folders use how much disk usage 
du --max-depth=1 | sort -n  #sort from little to big folder size

grep example link: https://www.linuxtechi.com/linux-grep-command-with-14-different-examples/
-------------------------------------------------------------------------------------------------------------------------------

how to create user in kubernetes(serviceAccount): https://github.com/kubernetes/dashboard/wiki/Creating-sample-user

good Doc about kubernetes: https://github.com/cookeem/kubeadm-ha/blob/master/README.md

getting start-started prometheus operator with simple example: https://coreos.com/operators/prometheus/docs/latest/user-guides/getting-started.html
good doc about monitor service that is outside of kubernetes: https://devops.college/prometheus-operator-how-to-monitor-an-external-service-3cb6ac8d5acb

list of all exporter: https://github.com/prometheus/docs/blob/master/content/docs/instrumenting/exporters.md

all youtube prometheus video: https://www.youtube.com/channel/UC4pLFely0-Odea4B2NL1nWA/videos

crd in kubernetes : https://kubernetes.io/docs/tasks/access-kubernetes-api/custom-resources/custom-resource-definitions/

------------------------------------------------------------------------------------------------------------------------------------------------------------

storage of prometheus metrics 
pv & pvc : https://kubernetes.io/docs/concepts/storage/persistent-volumes/
statefulset: 
glusterfs link : https://github.com/gluster/gluster-kubernetes/blob/master/docs/examples/hello_world/README.md
prometheus operator storage : https://github.com/coreos/prometheus-operator/blob/master/Documentation/user-guides/storage.md

Etcd monitoring : https://coreos.com/etcd/docs/latest/metrics.html
external ETCD monitoring: https://jpweber.io/blog/monitoring-external-etcd-cluster-with-prometheus-operator/

describe of Etcd metrics and alerting : https://blog.freshtracks.io/a-deep-dive-into-kubernetes-metrics-part-5-etcd-metrics-6502693fa58
------------------------------------------------------------------------------------------------------------------------------

grafana dashboards : 

-ingress-nginx dashboard: https://github.com/kubernetes/ingress-nginx/blob/master/docs/user-guide/monitoring.md


--------------------------------------------------------

what is network checker: https://github.com/Mirantis/k8s-netchecker-server
network checker monitoring : https://github.com/Mirantis/k8s-netchecker-server/blob/master/doc/metrics.md
A Deep Dive into Kubernetes Metrics : https://blog.freshtracks.io/a-deep-dive-into-kubernetes-metrics-b190cc97f0f6



-------------------------------------------------------------------------------

rasbperry config: 
https://ubuntu-mate.community/t/stop-the-screen-from-blanking-in-ubuntu/678
https://ubuntu-mate.community/t/how-can-i-turn-the-screensaver-powersavings-off/5414
https://ubuntu-mate.community/t/remove-password-prompts/1282



---------------------------------------------------------------------------------------

a good kubernetes networking modeling: https://sookocheff.com/post/kubernetes/understanding-kubernetes-networking-model/

generate ssl certificate tutorial: https://jite.eu/2019/2/6/ca-with-cfssl/
--------------------------------------------------------------------------------------

postgresql exporter: https://github.com/wrouesnel/postgres_exporter/

postgresql alert ref: https://www.postgresql.eu/events/pgconfeu2018/sessions/session/2166/slides/147/monitoring.pdf


--------------------------------------------certificate-----------------------------------------------------------------
https://www.globalsign.com/en/ssl-information-center/what-is-an-ssl-certificate/
https://www.globalsign.com/en/ssl-information-center/types-of-ssl-certificate/
--------------------tokenization vs encryption-----------------------------------
https://www.skyhighnetworks.com/cloud-security-university/tokenization-vs-encryption/


--------------------------------------------------------database monitoring ssl connection--------------------------------------------
https://www.linode.com/docs/web-servers/nginx/how-to-configure-nginx/
https://bobcares.com/blog/nginx-ddos-prevention/
https://www.nginx.com/blog/mitigating-ddos-attacks-with-nginx-and-nginx-plus/
https://www.nginx.com/blog/inside-nginx-how-we-designed-for-performance-scale/
http://www.steves-internet-guide.com/ssl-certificates-explained/
https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-18-04 **
https://www.ssllabs.com  <--- certificate validate
https://explainshell.com/explain?cmd=echo+-n+%27Hello.%27+%7C+base64  <---- base64 conversion  
https://www.digitalocean.com/community/tutorials/understanding-nginx-server-and-location-block-selection-algorithms


-------------------------------------------------------------RAR----------------------------------------------
https://www.tecmint.com/how-to-open-extract-and-create-rar-files-in-linux/





----------------------------------------------python----------------------
https://www.fullstackpython.com/table-of-contents.html




----------------------------------kubernets in easy way -------------------------
https://www.bmc.com/blogs/kubernetes-replicaset/
https://www.bmc.com/blogs/author/toye_idowu/page/2/
https://www.bmc.com/blogs/kubernetes-networking/


--------------------------------------------Devop----------------------------------
https://dev.to/joehobot/devops-roadmap-5d0


-------------------------------------------Yaml tutorial---------------------------
*https://www.mirantis.com/blog/introduction-to-yaml-creating-a-kubernetes-deployment/
**https://developer.ibm.com/tutorials/yaml-basics-and-usage-in-kubernetes/
main doc for know yaml doc for k8s:
https://kubernetes.io/docs/reference/generated/kubernetes-api


----------------------------advanced copy ---------------------------------
https://www.tecmint.com/advanced-copy-command-shows-progress-bar-while-copying-files/


--------------------------bootable for linux image ---------------------------------------
sudo \dd if=~/Downloads/ubuntu-17.10.1-desktop-amd64.iso of=/dev/sdb


---------------------------kubeclt use-contex--------
kubectl config use-context kubernetes-admin@k8s.qcluster.org    <------ kubernetes-admin@k8s.qcluster.org is the name in ~/.kube/config that we can change beetween clusters

-------------------------------------------------------general health check------------------------------------------------------------
----------telegram send alert to group
https://answers.splunk.com/answers/590658/telegram-alert-action-where-do-you-get-a-chat-id.html
https://firstwarning.net/vanilla/discussion/4/create-telegram-bot-and-get-bots-token-and-the-groups-chat-id

curl -x $https_proxy -X GET "https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage?chat_id=$TELEGRAM_GROUP&text=$MSG"
TELEGRAM_GROUP='-328266093'
export MAIL_TOKEN='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'
export TELEGRAM_TOKEN='879341611:AAHjdFnz30JHuXepwl4XUgaufH8hriMDjT8'
export TELEGRAM_GROUP='-328266093'
export SERVER='pg1'
export PROXY_IP='proxy1.qcluster.org'
export PROXY_PORT=3128
export http_proxy="http://kube:bloodsucker@$PROXY_IP:$PROXY_PORT"
export https_proxy="http://kube:bloodsucker@$PROXY_IP:$PROXY_PORT"
---------------------------------------------------------------------------------------Docker good command-------------------
docker run -it --user root telegramtest
 docker run -d alimoslehirad/web
docker exec -it 283bab25211b sh  //comment: between sh and /bin/bash is difrence
docker exec -it --user root telegramtest /bin/bash
docker images | grep production
docker container kill 8d9e7b65e1f5
docker build -t k8s_production_mon .
docker images -a  // show unclosed container 
docker rmi 397236158920
docker logs -f f5b8ee0a61f7
docker ps -a | grep toman | head
docker container list
docker rmi ddcdcdb8b721 --force
docker run -it --user root --net=host telegramtest  //when docker container hasen not
sudo docker push alimoslehirad/k8s_production_mon:1.0
docker rm `docker ps -a | awk '{print $1}'` //remove all failed docker images
+++++---------- user proxy for docker environment method-------+++-----------------------
vim /etc/systemd/system/docker.service.d/http-proxy.conf
copy this lines: 
[Service]
Environment="HTTP_PROXY=http://198.143.181.21:3128"
Environment="HTTP_PROXY=http://198.143.181.21:3128"
Environment="NO_PROXY= hostname.example.com,172.10.10.10"
systemctl daemon-reload
systemctl restart docker



------------------------------------------------------------------------------------------django-------------------------------------------------------------------
https://hostadvice.com/how-to/how-to-create-a-simple-web-app-with-django-2/ #first link i use to learn django with example
https://www.tutorialspoint.com/django/django_environment.htm    # second refrence to learn django



----------------------------------------------------------------------------------------postgresql----------------------------------
++++++++++++++++++++benefit command
sudo -u postgres pg_dump qpay | gzip > /root/qpay.dump.gz
    To view help for psql commands, type \?.
    To view help for SQL commands, type \h.
    To view information about the current database connection, type \conninfo.
    To list the database's tables and their respective owners, type \dt.
    To list all of the tables, views, and sequences in the database, type \z.
    To exit the psql program, type \q.
\d+ viewname  # info about view 
\d # all table
sudo -u postgres pg_dump hc-qpay-staging > /var/lib/postgresql_data/hc-qpay-staging.dump  #dump of data base
pg_dumpall -U postgres | gzip > backup.$(date +"%Y_%m_%d")_pg_bck.gz
pg_ctlcluster 10 main restart
+++++++++++++++++++++repmgr 
sudo -u postgres repmgr cluster show


+++++++++++++++++++++barman
barman list-backup pg1
repmgr standby follow
repmgr -h pg2.qbitco.net -U repmgr -d repmgr -f /etc/repmgr.conf standby clone --dry-run


https://www.digitalocean.com/community/tutorials/how-to-use-roles-and-manage-grant-permissions-in-postgresql-on-a-vps--2  # postgresql benefit command
--------------------------------------grant select all table to user-----------------
GRANT SELECT ON ALL TABLES IN SCHEMA public TO username;



----------------------------------------------------------------------------------------tar benefit command---------------------------------------------------------
18 benefit command in tar:
https://www.tecmint.com/18-tar-command-examples-in-linux/



-------------------------------------------------------------------------------------chown-----------------------------------
chown [options] [newowner][:newgroup] filenames
chown sally:skyhook forward.odt

chown [options] [newowner][:newgroup] -R directory # implements the ownership change on an entire directory tree.



---------------------------------------------------------------------------------kubernetes vs openshift---------------------------
https://cloudowski.com/articles/10-differences-between-openshift-and-kubernetes


----------------------------------------------------------------------------------RBAC And create user in kubernetes----------------------------------------------------

https://www.youtube.com/watch?v=CnHTCTP8d48



-------------------------------------------------------------------------------------- read hex show of a file like MBR--------------------------------------
sudo dd if=/dev/sda bs=512 count=4 | hexdump -C


backup from mbr : sudo dd if=/dev/sda > ./backup-sda.mbr bs=512 count=1
backup from partition of disk: sfdisk -d /dev/sda > ./backup-sda.sfdisk

restore from backup : sfdisk -f /dev/sda < backup-sda.sfdisk



--------------------------------------------------------------------------------------mysql good command ----------------------------------------------------------------
--> reset password:
1.insert skip-grant-tables under [mysqld] in mysql.cnf
2.restart mysql 
3.inter mysql to loging to mysql cli
4.UPDATE mysql.user SET authentication_string=PASSWORD('to#K;wdGo0l7') WHERE User='root';
5.\q
6.comment skip-grant-tables
7.restart mysql
8.mysql -u root -p

--> master slave replication
use this links :
https://www.digitalocean.com/community/tutorials/how-to-set-up-master-slave-replication-in-mysql
https://devopscube.com/setup-mysql-master-slave-replication/

1. master

bind-address           = 10.128.0.11
server-id              = 1

log_bin                = /var/log/mysql/mysql-bin
---

inter to mysql cli as root 
1.1.CREATE USER 'replicauser4'@'192.168.1.181' IDENTIFIED BY 't2u5r;gqk,Lr';
1.2.GRANT REPLICATION SLAVE ON *.* TO 'replicauser4'@'192.168.1.181' IDENTIFIED BY 't2u5r;gqk,Lr';
1.3.SHOW MASTER STATUS\G
1.4.dump all database
2.slave
bind-address           = 10.128.0.12
server-id              = 2
log_bin                = /var/log/mysql/mysql-bin
2.1.restore dump to slave mysql 
2.2.STOP SLAVE;
2.3.CHANGE MASTER TO MASTER_HOST='192.168.1.195',MASTER_USER='replicauser6', MASTER_PASSWORD='t2u5r;gqk,Lr', MASTER_LOG_FILE='mysql-bin.000005', MASTER_LOG_POS=2201;
2.4.START SLAVE;
2.5.SHOW SLAVE STATUS\G


SHOW SLAVE STATUS\G
mysqldump -u root --all-databases -p > dumpfull.dump
mysql -u root -p < hotstandbyDump.dump
---> how to see all user host and name
SELECT User, Host FROM mysql.user;

---> how to change a table field for example user permission host
UPDATE mysql.user SET Host='%' WHERE Host='localhost' AND User='username';
FLUSH PRIVILEGES;
DROP USER 'hc-qpay-staging-dev-user'@'%';
---> create user and grant access to a spicific database
CREATE USER 'hc-qpay-staging-dev-user'@'%' IDENTIFIED BY '8@V!sy2ngcauzg543n';
GRANT ALL PRIVILEGES ON hc_qpay_staging_dev.* TO 'hc-qpay-staging-dev-user'@'%';

---> backup solutions

http://www.ducea.com/2006/05/27/backup-your-mysql-databases-automatically-with-automysqlbackup/ 
---> galera clustering 
https://blog.jetserver.net/how-to-install-configure-a-galera-cluster-with-mysql-on-centos-7

---> keepalived and ha mysql on centos 
https://www.codeproject.com/Articles/1272428/MySQL-Auto-Failover-using-Keepalived-on-CentOS




-----------------------------------------------------------------------------------openshift----------------------------------------------------------
autoscale example:
https://blog.openshift.com/openshift-3-1-pod-autoscaling/


----------------------------------------------------------------------------------Ansible-------------------------------------------------------------
https://serversforhackers.com/c/an-ansible-tutorial

---> lamp(linux apache Mysql php) on centos example

---------------------------------------------------------------------------------Nginx---------------------------------------------------------------
---> nginx best repo for all server config issue
https://github.com/h5bp/server-configs-nginx

-------------------------------------------------------------------------------proxy test-------------------------------------------------------------
curl -x 185.53.140.20:8000 --proxy-user qbit:RjT82CBDw3XOq2YQ https://us.yahoo.com -k
