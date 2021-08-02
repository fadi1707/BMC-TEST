FROM nginx

RUN apt-get update -y 

RUN apt-get install sudo openssh-server systemd openssh-client -y

#RUN adduser nginx

RUN usermod -aG sudo nginx
WORKDIR /home/nginx

RUN  echo 'root:test' | chpasswd
RUN  echo 'nginx:test' | chpasswd

RUN echo "nginx ALL=(ALL) NOPASSWD:/bin/mkdir,/bin/rmdir" >> /etc/sudoers

RUN echo "nginx  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/nginx

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]

#USER nginx

