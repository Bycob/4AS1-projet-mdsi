#!/bin/bash

# go to the root of the project
current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd $current_dir/..

# generate xslt
echo -e "\e[44mgenerating xslt...\e[49m"
xsltproc --xinclude --output html/maquette.html xslt/maquette.xsl examples/maquette.xml
