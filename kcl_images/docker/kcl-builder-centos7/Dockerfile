FROM centos:centos7

# macOS M1 --platform linux/amd64
# try fix "Problem with the SSL CA cert (path? access rights?)"
# https://issueexplorer.com/issue/docker/for-mac/5912
# https://access.redhat.com/articles/2050743
RUN touch /etc/sysconfig/64bit_strstr_via_64bit_strstr_sse2_unaligned

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y epel-release
RUN yum groups mark install "Development Tools"
RUN yum groups mark convert "Development Tools"
RUN yum groupinstall "Development Tools"
# ---------------------------------------------------------------------------------
# 请注意：以下步骤是为编译 CPython 在 centos7 上安装依赖包所需的，请参见
# [Python 官方网站](https://devguide.python.org/setup/#install-dependencies) 了解详细信息。
# ---------------------------------------------------------------------------------

# 一些与开发和编译相关的语言环境和插件，例如 git、CPython 编译等。
RUN yum groupinstall -y "Development Tools"
# 编译 CPython 所需的编译器和工具链，例如 gcc、make、sqlite3、ctype、struct 等。
RUN yum install -y gcc patch libffi-devel python-devel zlib-devel bzip2-devel ncurses-devel sqlite-devel 
RUN yum install -y libpcap-devel xz-devel readline-devel tk-devel gdbm-devel db4-devel
# 安装 UNIX 系统上 python3 所需的系统库
RUN yum -y install yum-utils
RUN yum-builddep -y python3
# 编译 Python 源码时需要的 python zlib 模块依赖包
RUN yum install -y zlib* 
# 编译 Python 源码时需要的 python ssl 模块依赖包
RUN yum install -y openssl-devel

# 安装 which
RUN yum install -y which

# 安装 wget
RUN yum install -y wget

# rust
# https://www.rust-lang.org/tools/install
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y --default-toolchain 1.83.0
ENV PATH="/root/.cargo/bin:${PATH}"
ENV CARGO_NET_GIT_FETCH_WITH_CLI=true

RUN cargo version
RUN rustc --version

# wasm
RUN rustup target add wasm32-unknown-unknown

RUN yum -y install centos-release-scl
RUN yum -y install llvm-toolset-7.0
RUN yum -y install llvm-toolset-7.0\*

# 安装 gcc7
RUN yum -y install devtoolset-7*
RUN scl enable devtoolset-7 bash
RUN gcc -v

# 设置 LD_LIBRARY_PATH 和 PATH
ENV LD_LIBRARY_PATH="/opt/rh/llvm-toolset-7.0/root/usr/lib64:${LD_LIBRARY_PATH}"
ENV PATH="/opt/rh/llvm-toolset-7.0/root/usr/bin:${PATH}"

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone

WORKDIR /root

CMD ["bash"]
