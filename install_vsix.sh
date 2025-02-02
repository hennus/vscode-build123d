#!/bin/bash
publisher=$1
name=$2
version=$(curl -s -c cookies.txt "https://marketplace.visualstudio.com/items?itemName=${publisher}.${name}" | grep -o 'VersionValue":"\([^"]*\)' | cut -c 16-)
echo "Installing $1.$2:$version"
curl -s --compressed -j -b cookies.txt -o ${publisher}.${name}.vsix  https://marketplace.visualstudio.com/_apis/public/gallery/publishers/${publisher}/vsextensions/${name}/${version}/vspackage
/usr/bin/code-server --install-extension ${publisher}.${name}.vsix
rm ${publisher}.${name}.vsix
