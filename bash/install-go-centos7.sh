#!/bin/bash

version="1.11.5"
package_path_tgz="/tmp/go${version}.linux-amd64.tar.gz"
package_path="/usr/local/go"
gopath="$HOME/go"

if [[ ! -f "${package_path_tgz}" ]]
then
    wget -q "https://dl.google.com/go/go${version}.linux-amd64.tar.gz" -O "${package_path_tgz}"
elif [[ ! -d "${package_path}" ]]
then
    tar zxf "${package_path_tgz}" -C /usr/local
fi

is_path=$(grep /usr/local/go/bin ~/.bash_profile | wc -l)
is_gopath=$(grep gopath ~/.bash_profile | wc -l)

if [[ "${is_path}" -eq 0 ]]
then
    sed -i '/export PATH/i\PATH=$PATH:/usr/local/go/bin' ~/.bash_profile
fi

if [[ "${is_gopath}" -eq 0 ]]
then
    sed -i "/export PATH/i\GOPATH=${gopath}\nexport GOPATH" ~/.bash_profile
fi

if [[ ! -d ~/go ]]
then
    mkdir -p ~/go/{src,pkg,bin}
fi

source ~/.bash_profile

echo "go path:  $GOPATH"
go version
