FROM wordpress:5-apache

RUN set -eux; \
        if command -v a2enmod; then \
                a2enmod rewrite; \
        fi; \
        savedAptMark="$(apt-mark showmanual)"; \
        apt-get update; \
        apt-get install -y --no-install-recommends \
                curl \
                vim \
                less \
                default-mysql-client \
                git \
                wget \
                npm \
                unzip;

WORKDIR /opt/wordpress
COPY . .

# /var/www/html/wp-content/themes/
# /var/www/html/wp-content/plugins/

RUN wget https://getcomposer.org/download/1.10.13/composer.phar
RUN chmod +x composer.phar
RUN mv composer.phar /usr/local/bin/composer

RUN set -eux; \
    COMPOSER_MEMORY_LIMIT=-1 /usr/local/bin/composer global require wp-cli/wp-cli-bundle 

RUN set -eux; \
    ~/.composer/vendor/wp-cli/wp-cli/bin/wp core download --allow-root
RUN set -eux; \
    rm -rf /var/www/html
RUN set -eux; \
    ln -s /var/www/html /opt/wordpress/wp

EXPOSE 80

RUN set -eux; \
    chmod +x ./bootscript.sh

CMD ./bootscript.sh
