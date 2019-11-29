FROM php:7.4-apache

# Copy VHost-Configuration into Container
COPY docker-config/php-apache/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN mv /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini

ENV XDEBUG_CONFIG="idekey=PHPSTORM"
ENV PHP_IDE_CONFIG="serverName=Tender_Workflow"


RUN apt-get update
RUN apt-get install -y \
        curl \
        gnupg \
        libldap2-dev \
        libzip-dev \
        libpng-dev \
        zip \
        libicu-dev \
        git

# Install NodeJs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update && apt-get -y install nodejs

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get -y install yarn

# Install latest composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# Install X-Debug
RUN pecl install xdebug

RUN rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/
RUN docker-php-ext-install ldap
RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install zip
RUN docker-php-ext-install json
RUN docker-php-ext-install fileinfo
RUN docker-php-ext-install intl
RUN docker-php-ext-install opcache
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install gd

RUN docker-php-ext-enable xdebug

# Enable ModRwrite
RUN a2enmod rewrite

# Install Symfony Binary
RUN curl -sS https://get.symfony.com/cli/installer | bash && \mv /root/.symfony/bin/symfony /usr/local/bin/symfony


