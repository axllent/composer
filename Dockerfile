FROM alpine:3.15

COPY install.sh /install.sh

RUN apk add --no-cache bash && \
    /install.sh 7.4 && \
    apk del bash && \
    rm -f /install.sh

COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer

ENV COMPOSER_HOME=/tmp/composer \
    COMPOSER_CACHE_DIR=/tmp/composer-cache \
    COMPOSER_FUND=0
    
RUN mkdir /app
WORKDIR /app

ENTRYPOINT ["composer"]
