FROM ubuntu:14.04
MAINTAINER Viet Hung Nguyen <hvn@familug.org>

RUN apt-get -y update && apt-get install -y curl
RUN curl -Lo /tmp/master.tar.gz https://github.com/hvnsweeting/states/archive/master.tar.gz
RUN mkdir -p /root/salt/pillar
RUN curl -Lo /root/salt/pillar/common.sls https://gist.githubusercontent.com/hvnsweeting/d8143b10e02fff01c434/raw/12a367dbcdc4a3bf7119922e190c7ea9b63f7a23/common.sls
RUN printf 'base:\n  "*":\n    - common\n' > /root/salt/pillar/top.sls
RUN cd /; tar xzf /tmp/master.tar.gz -C /root/salt
RUN mv /root/salt/states-master /root/salt/states
RUN /root/salt/states/salt/minion/bootstrap.sh `hostname`
RUN salt-call -linfo -c /root/salt/states/test grains.items
RUN salt-call -linfo -c /root/salt/states/test state.sls vim
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
