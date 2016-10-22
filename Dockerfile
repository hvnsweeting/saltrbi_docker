FROM ubuntu:14.04
MAINTAINER Viet Hung Nguyen <hvn@familug.org>

RUN apt-get -y update && apt-get install -y curl
RUN curl -LO /tmp/bootstrap.sh https://raw.githubusercontent.com/hvnsweeting/states/master/salt/minion/bootstrap.sh && chmod a+x /tmp/bootstrap.sh
RUN /tmp/bootstrap.sh `hostname`
RUN apt-get install -y software-properties-common && rm -rf /var/lib/apt/lists/*
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
