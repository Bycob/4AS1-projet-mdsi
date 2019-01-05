#!/bin/bash

# go to the root of the project
current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd $current_dir/..

# validate xml
echo -e "\e[44mValidating personnel.xml...\e[49m"
xmllint --noout --schema schema/personnel.xsd examples/personnel.xml
echo -e "\e[44mValidating ufs.xml...\e[49m"
xmllint --noout --schema schema/uf.xsd examples/ufs.xml
echo -e "\e[44mValidating maquette.xml...\e[49m"
xmllint --noout --schema schema/maquette.xsd examples/maquette.xml
