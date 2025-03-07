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
    php${MM}~=${PHP_VERSION} \
    php${MM}-bcmath~=${PHP_VERSION} \
    php${MM}-bz2~=${PHP_VERSION} \
    php${MM}-common~=${PHP_VERSION} \
    php${MM}-ctype~=${PHP_VERSION} \
    php${MM}-curl~=${PHP_VERSION} \
    php${MM}-exif~=${PHP_VERSION} \
    php${MM}-fileinfo~=${PHP_VERSION} \
    php${MM}-gd~=${PHP_VERSION} \
    php${MM}-gettext~=${PHP_VERSION} \
    php${MM}-gmp~=${PHP_VERSION} \
    php${MM}-iconv~=${PHP_VERSION} \
    php${MM}-intl~=${PHP_VERSION} \
    php${MM}-mbstring~=${PHP_VERSION} \
    php${MM}-opcache~=${PHP_VERSION} \
    php${MM}-openssl~=${PHP_VERSION} \
    php${MM}-pcntl~=${PHP_VERSION} \
    php${MM}-phar~=${PHP_VERSION} \
    php${MM}-posix~=${PHP_VERSION} \
    php${MM}-session~=${PHP_VERSION} \
    php${MM}-simplexml~=${PHP_VERSION} \
    php${MM}-tokenizer~=${PHP_VERSION} \
    php${MM}-xml~=${PHP_VERSION} \
    php${MM}-xsl~=${PHP_VERSION} \
    php${MM}-zip~=${PHP_VERSION}

# Symlink /usr/bin/php to /usr/bin/phpXY
if [ ! -f "/usr/bin/php" ]; then
    ln -s /usr/bin/php${MM} /usr/bin/php || exit 2
fi

# Symlink /etv/php to /etc/phpXY
if [ ! -h "/etc/php" ]; then
    ln -s /etc/php${MM} /etc/php || exit 2
fi
