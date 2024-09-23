FROM amazonlinux:2023

RUN yum update -y && \
    yum install -y python3.11 python3.11-pip zip && \
    yum clean all

RUN python3.11 -m pip install --upgrade pip
RUN python3.11 -m pip install numpy pandas
