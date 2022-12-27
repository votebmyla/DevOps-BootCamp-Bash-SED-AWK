#!/bin/bash

# Create copy of passwd file to passwd_new. :exclamation: Do all modifications on passwd_new file
cat passwd > passwd_new

# Change shell for user saned from /usr/sbin/nologin to /bin/bash using AWK
awk -i inplace '/saned/ {sub(/usr\/sbin\/nologin/, "bin/bash")} 1' passwd_new

# Change shell for user avahi from /usr/sbin/nologin to /bin/bash using SED
sed -i '/avahi/ s/usr\/sbin\/nologin/bin\/bash/' passwd_new

# Save only 1-st 3-th 5-th 7-th columns of each string based on : delimiter
awk -i inplace -F: -v OFS=: '{print $1,$3,$5,$7}' passwd_new

# Remove all lines from file containing word daemon
sed -i '/daemon/d' passwd_new

# Change shell for all users with even UID to /bin/zsh
awk -i inplace -F: -v OFS=: '($2%2)==0 {$NF="/bin/zsh"} 1' passwd_new