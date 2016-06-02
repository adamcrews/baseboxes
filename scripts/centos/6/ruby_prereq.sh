#!/bin/sh

sudo yum -y install rpmdevtools
sudo yum -y install glibc-devel readline-devel libyaml-devel ncurses-devel gdbm-devel tcl-devel openssl-devel db4-devel libffi-devel
sudo yum -y install make gcc unzip byacc
mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
cd ~/rpmbuild
wget https://github.com/slalompdx/ruby/raw/master/ruby-el6.spec -O ~/rpmbuild/SPECS/ruby.spec
wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz -O ~/rpmbuild/SOURCES/ruby-2.3.1.tar.gz
rpmbuild -ba ~/rpmbuild/SPECS/ruby.spec
sudo yum -y install ~/rpmbuild/RPMS/x86_64/ruby2-2.3.1-1.el6.centos.x86_64.rpm
