FROM docker:dind

ENV EDITOR nano
RUN adduser -h /home/developer -s /bin/bash -D developer

RUN apk update && apk --no-cache add sudo curl nano bash vim \
  python py-crcmod openssl openssh-client git libc6-compat \
  gnupg 

#AWS
RUN apk add --update python py-pip ca-certificates groff zip && \
  pip install --upgrade pip awscli 

#Ansible
RUN apk add gcc make libffi-dev musl-dev openssl-dev perl python-dev sshpass && \
  pip install --upgrade pip cffi  && \
  pip install ansible boto3 boto

#Clean up
RUN rm -rf /tmp/* && \
  rm -rf /var/cache/apk/*

#Add default hosts
ADD hosts /etc/ansible/hosts

#add a test file
ADD test-playbook.yaml /home/developer/aws-ansible-test/test-playbook.yaml

#copy credentials if there are any
COPY .aws /root/.aws

WORKDIR /home/developer/aws-ansible-test
CMD ["ansible-playbook", "--version"]


