#!/bin/bash

# Put you code here
cp passwd ./passwd_new
awk -i inplace '/saned/ {sub(/usr\/sbin\/nologin/, "bin/bash")} 1' passwd_new
sed -i '/avahi/ s/usr\/sbin\/nologin/bin\/bash/' passwd_new