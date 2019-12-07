FROM php:7.4-apache

ENV ACCEPT_EULA=Y
ENV LD_LIBRARY_PATH /var/opt/php-ext/lib:${LD_LIBRARY_PATH}

RUN if [ -n "$HTTP_PROXY" ]; then pear config-set http_proxy $HTTP_PROXY; fi

COPY docker-config/php-cli/.ssh /root/.ssh
COPY docker-config/php-cli/php-extra.ini /usr/local/etc/php/conf.d/php-extra.ini
RUN mv /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Microsoft SQL Server Prerequisites
RUN apt-get update \
    && apt-get install -y --no-install-recommends gnupg apt-utils \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/9/prod.list \
        > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get install -y --no-install-recommends \
        locales \
        apt-transport-https \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
        unixodbc-dev \
        msodbcsql17

RUN apt-get install -y \
        curl \
        gnupg \
        wget \
        libldap2-dev \
        libzip-dev \
        libicu-dev \
        libpng-dev \
        zip \
        nodejs \
        yarn \
        libssh2-1-dev \
        libssh2-1 \
    && rm -rf /var/lib/apt/lists/*

# Install MSSQL php driver, xdebug
RUN pecl install sqlsrv \
    && pecl install pdo_sqlsrv \
    && pecl install xdebug \
    && pecl install ssh2-1.1.2

RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install ldap \
    && docker-php-ext-install zip \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install gd \
    && docker-php-ext-install json \
    && docker-php-ext-install fileinfo \
    && docker-php-ext-install intl \
    && docker-php-ext-install opcache \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-enable xdebug sqlsrv pdo_sqlsrv ssh2

RUN wget https://www.phing.info/get/phing-latest.phar \
    && mv ./phing-latest.phar /usr/bin/phing \
    && chmod +x /usr/bin/phing