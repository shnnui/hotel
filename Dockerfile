# Select ubuntu as the base image
FROM ubuntu:16.04

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
RUN echo "" > /etc/apt/sources.list
RUN { \
        echo 'deb-src http://archive.ubuntu.com/ubuntu xenial main restricted #Added by software-properties'; \
        echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted'; \
        echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted multiverse universe #Added by software-properties'; \
        echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted'; \
        echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted multiverse universe #Added by software-properties'; \
        echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial universe'; \
        echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe'; \
        echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial multiverse'; \
        echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-updates multiverse'; \
        echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse'; \
        echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse #Added by software-properties'; \
        echo 'deb http://archive.canonical.com/ubuntu xenial partner'; \
        echo 'deb-src http://archive.canonical.com/ubuntu xenial partner'; \
        echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted'; \
        echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted multiverse universe #Added by software-properties'; \
        echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe'; \
        echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-security multiverse'; \
    } >> /etc/apt/sources.list
RUN apt-get update

# Install vim
RUN apt-get install -qy vim vim-scripts vim-doc
RUN { \
      echo 'set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom'; \
      echo 'set termencoding=utf-8'; \
      echo 'set encoding=utf-8'; \
    } >> /etc/vim/vimrc

# 时区处理
RUN apt-get install tzdata
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# 安装ssh
RUN apt-get -y  install ssh

# Install nginx, nodejs and curl
RUN apt-get update -q
RUN apt-get install -qy nginx
RUN apt-get install -qy curl
RUN apt-get install -qy nodejs
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# 安装pgsql
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list
RUN apt-get install -qy wget
RUN /bin/bash -l -c "wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -"
RUN apt-get update
RUN apt-get install -qy postgresql-9.6
# 安装postgresql-contrib-9.6 （附加提供的模块）
RUN apt-get install -y  postgresql-contrib-9.6

# 安装rbenv
# 安装Rails所必须的各种常见依赖
RUN apt-get install -qy build-essential git-core bison openssl
RUN apt-get install -qy libreadline6-dev zlib1g zlib1g-dev libssl-dev
RUN apt-get install -qy libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3
RUN apt-get install -qy autoconf libc6-dev libpcre3-dev libcurl4-nss-dev
RUN apt-get install -qy libxml2-dev libxslt-dev imagemagick libffi-dev

# Install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN echo '# rbenv setup' > /etc/profile.d/rbenv.sh
RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
RUN echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN chmod +x /etc/profile.d/rbenv.sh
RUN /etc/profile.d/rbenv.sh

# install ruby-build
RUN mkdir /usr/local/rbenv/plugins
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
RUN /usr/local/rbenv/plugins/ruby-build/install.sh

ENV PATH /usr/local/rbenv/shims:/usr/local/rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN rbenv install 2.5.1
RUN rbenv global 2.5.1

RUN gem install bundler


