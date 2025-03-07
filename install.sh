#!/bin/bash
set -ex

if [ $# -eq 1 ]; then
    PHP_VERSION=$1
fi

# Calculate php semver (we only need major for xdebug version)
semver=(${PHP_VERSION//./ })
MAJOR="${semver[0]}"
MINOR="${semver[1]}"

# Alpine releases are prefixed as php<MajorMinor>
MM="${MAJOR}${MINOR}"

apk add --no-cache \
    php${MAJOR}~=${PHP_VERSION} \
    php${MAJOR}-bcmath~=${PHP_VERSION} \
    php${MAJOR}-bz2~=${PHP_VERSION} \
    php${MAJOR}-common~=${PHP_VERSION} \
    php${MAJOR}-ctype~=${PHP_VERSION} \
    php${MAJOR}-curl~=${PHP_VERSION} \
    php${MAJOR}-exif~=${PHP_VERSION} \
    php${MAJOR}-fileinfo~=${PHP_VERSION} \
    php${MAJOR}-gd~=${PHP_VERSION} \
    php${MAJOR}-gettext~=${PHP_VERSION} \
    php${MAJOR}-gmp~=${PHP_VERSION} \
    php${MAJOR}-iconv~=${PHP_VERSION} \
    php${MAJOR}-intl~=${PHP_VERSION} \
    php${MAJOR}-mbstring~=${PHP_VERSION} \
    php${MAJOR}-opcache~=${PHP_VERSION} \
    php${MAJOR}-openssl~=${PHP_VERSION} \
    php${MAJOR}-pcntl~=${PHP_VERSION} \
    php${MAJOR}-phar~=${PHP_VERSION} \
    php${MAJOR}-posix~=${PHP_VERSION} \
    php${MAJOR}-session~=${PHP_VERSION} \
    php${MAJOR}-simplexml~=${PHP_VERSION} \
    php${MAJOR}-tokenizer~=${PHP_VERSION} \
    php${MAJOR}-xml~=${PHP_VERSION} \
    php${MAJOR}-xsl~=${PHP_VERSION} \
    php${MAJOR}-zip~=${PHP_VERSION}

# Symlink /usr/bin/php to /usr/bin/phpXY
if [ ! -f "/usr/bin/php" ]; then
    ln -s /usr/bin/php${MAJOR} /usr/bin/php || exit 2
fi

# Symlink /etv/php to /etc/phpXY
if [ ! -h "/etc/php" ]; then
    ln -s /etc/php${MM} /etc/php || exit 2
fi
