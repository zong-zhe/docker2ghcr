FROM centos:7

# 清理 yum 缓存目录以释放空间
RUN yum clean all \
  && rm -rf /var/cache/yum

# 设置阿里云的 Yum 镜像源
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup && \
    curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo && \
    sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo && \
    yum clean all && \
    yum makecache

RUN yum -y update && \
    yum install gcc gcc-c++ glibc-static -y 

RUN yum -y install wget

RUN yum -y install git

RUN yum -y install python3

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain 1.83.0

ENV PATH="/root/.cargo/bin:${PATH}"

RUN yum -y install java-1.8.0-openjdk-devel

RUN wget https://repo.huaweicloud.com/apache/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz && \
    tar -xzf apache-maven-*.tar.gz && \
    mkdir -p /opt/maven && \
    mv apache-maven-* /opt/maven && \
    ln -s /opt/maven/apache-maven-3.9.6/bin/mvn /usr/bin/mvn

CMD ["tail", "-f", "/dev/null"]
