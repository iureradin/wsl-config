#!/bin/bash

#sudo apt update -y

#apt install nano vim htop nmap tcpdump net-tools git zsh -y

function _add_alias() {
    ALIAS=($(awk '{print $2}' alias.txt | awk -F '=' '{print $1}'))
    if [[ -n $ALIAS ]]; then
        for((cont=0;cont<${#ALIAS[@]};cont++)); do
            echo "alias encontrado: ${ALIAS[cont]}"
            sed -i '/alias '${ALIAS[cont]}'/d' ~/.bashrc
        done
        cat alias.txt >> ~/.bashrc
    else
        echo "Nenhum alias foi encontrado"
    fi
}

_add_alias

