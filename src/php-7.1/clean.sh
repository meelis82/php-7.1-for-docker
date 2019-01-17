#!/usr/bin/env bash

apt-get remove -y $(dpkg -l|grep '\-dev'|awk '{ print $2 }')

puppet apply --modulepath=/src/php-7.1/clean/modules /src/php-7.1/clean/clean.pp
