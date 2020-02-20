FROM centos:centos6.8

RUN yum -y update;\
    yum -y install openssh-server passwd; \
    yum clean all

ADD ./init.sh /init.sh

RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

EXPOSE 22

RUN chmod 755 /init.sh

RUN ./init.sh
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
