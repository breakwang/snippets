### centos-sshd

Dockerized SSH service, built on top of official CentOS images.

#### Image tags

- breakwang/centos-sshd:6.8

#### Installed packages

Base:

- CentOS (6.8) minimal

Image specific:

- openssh-server

Config:

- PermitRootLogin yes
- UsePAM no
- exposed port 22
- default command: /usr/sbin/sshd -D
- root password: xxx

#### Build image

```
docker build -t breakwang/centos-sshd:6.8 .
```

#### Run example

```
$ sudo docker run -d -p 2222:22 --name centos_sshd breakwang/centos-sshd:6.8
$ ssh root@localhost -p 2222
```

#### Security

If you are making the container accessible from the public network,
You can do one of the following two things after launching the container:

- Change the root password: docker exec -ti centos_sshd passwd
- Don't allow passwords at all, use keys instead:

```
$ docker exec centos_sshd passwd -d root
$ docker cp public_keys centos_sshd:/root/.ssh/authorized_keys
$ docker exec centos_sshd chown root:root /root/.ssh/authorized_keys
```

#### Issues
If you run into any problems with this image, please create issues on [https://github.com/breakwang/Dockerfile](https://github.com/breakwang/Dockerfile)
