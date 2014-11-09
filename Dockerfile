FROM centos

RUN yum -y install yum-utils && yum -y update
RUN curl -sL https://rpm.nodesource.com/setup | bash -
RUN yum -y install nodejs gcc-c++ make vim

## In order to make this container reusable by injecting the scripts.
ONBUILD COPY files/ /srv/
ONBUILD RUN chmod -R 755 /srv

CMD /start

