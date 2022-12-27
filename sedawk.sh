#!/bin/bash

# Put you code here
cat passwd > passwd_new
awk -i inplace '/saned/ {sub(/usr\/sbin\/nologin/, "bin/bash")} 1' passwd_new
sed -i '/avahi/ s/usr\/sbin\/nologin/bin\/bash/' passwd_new
awk -i inplace -F: -v OFS=: '{print $1,$3,$5,$7}' passwd_new
sed -i '/daemon/d' passwd_new