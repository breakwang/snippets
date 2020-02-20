sudo yum install -y https://mirror.tuna.tsinghua.edu.cn/saltstack/yum/redhat/salt-repo-latest-2.el7.noarch.rpm

sudo sed "s/repo.saltstack.com/mirror.tuna.tsinghua.edu.cn\/saltstack/g"  /etc/yum.repos.d/salt-latest.repo
sudo yum clean expire-cache

sudo yum install -y salt-master salt-minion salt-ssh salt-cloud salt-api salt-syndic
