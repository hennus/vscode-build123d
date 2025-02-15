#!/bin/bash
set -e
set -u
set -o pipefail

microdnf -y update
microdnf -y install curl python3-pip python3-virtualenv git libglvnd-glx python3-NLopt python3.13 python3-pip python3-virtualenv entr make vim
microdnf clean all

alternatives --install /usr/bin/python python /usr/bin/python3.13 1
python3.13 -m ensurepip
python3.13 -m pip install --root-user-action=ignore --upgrade pip
python3.13 -m pip install --root-user-action=ignore -r /requirements.txt

### This installs the latest but for reproducibility it is better to have known versions
#python3.13 -m pip install --root-user-action=ignore --upgrade black ruff
#python3.13 -m pip install --root-user-action=ignore --upgrade ocp_vscode cadquery
#python3.13 -m pip install --root-user-action=ignore --upgrade git+https://github.com/gumyr/build123d
#python3.13 -m pip install --root-user-action=ignore --upgrade git+https://github.com/gumyr/bd_warehouse

mkdir /vscode
curl -fsSL https://code-server.dev/install.sh > /vscode/code-server-install.sh

sh < /code-server-install.sh

bash /install_vsix.sh "ms-python" "python"
bash /install_vsix.sh "ms-python" "black-formatter"
bash /install_vsix.sh "ms-vscode" "vs-keybindings"
bash /install_vsix.sh "charliermarsh" "ruff"
bash /install_vsix.sh "bernhard-42" "ocp-cad-viewer"
