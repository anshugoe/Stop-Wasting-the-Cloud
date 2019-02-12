FROM centos:latest
MAINTAINER sbakshi

##Install BOINC
RUN yum -y update
RUN yum -y install wget
RUN wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y localinstall http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y boinc-client

##Set working directory
WORKDIR /var/lib/boinc-client

##Run BOINC by default. Expects env vars for url and account key
CMD /etc/init.d/boinc-client start; sleep 5s; /usr/bin/boinccmd --project_attach ${boincurl} ${boinckey}; tail -f /var/lib/boinc/std*.txt