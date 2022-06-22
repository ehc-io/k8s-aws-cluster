#!/bin/bash
curl -s https://raw.githubusercontent.com/killer-sh/cks-course-environment/master/cluster-setup/latest/install_master.sh -o /root/master_install.sh
cd /root && git clone https://github.com/killer-sh/cks-course-environment.git