##Linux (Manjaro)
Nach der Installation User in docker Gruppe legen um ohne sudo starten zu können: https://docs.docker.com/engine/install/linux-postinstall/

```
$ sudo systemctl start docker
$ docker-machine start default
$ docker-compose up (oder docker-compose up -d php-apache)
$ docker-compose exec php-apache composer update
$ docker-compose exec php-apache composer install
$ docker-compose exec php-apache yarn
$ docker-compose exec php-apache yarn run dev
$ docker-compose exec php-apache symfony console (+make:entity, make:migration, doctrine:migrations:migrate...)
```