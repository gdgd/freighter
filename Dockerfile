FROM centos:7

RUN yum install -y vim git sudo
RUN git --version

RUN yum remove docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-selinux \
    docker-engine-selinux \
    docker-engine

RUN yum install -y yum-utils \
    device-mapper-persistent-data \
    lvm2

RUN yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

RUN yum-config-manager --enable docker-ce-edge
RUN yum-config-manager --enable docker-ce-test
RUN yum install -y docker-ce
RUN docker -v

RUN curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

#local/binにパスが通ってないのでシンボリックリンクを張る
RUN ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose
RUN docker-compose -v

RUN useradd -d /home/develop -m -s /bin/bash develop
RUN usermod -a -G docker develop

RUN service docker start 

#sodu無しで実行可能にしておく
#RUN cat /etc/passwd
#RUN cat /etc/group
#RUN usermod -a -G docker wheel

CMD [ "/bin/bash" ]