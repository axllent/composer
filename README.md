# Docker container for PHP & composer

An Alpine Linux docker container containing a specific major/minor version of PHP and composer.

This project is intended for personal use, however others may get use out of it too. 
Docker image builds are triggered manually within Github Actions and use the git branch for tagging.

Please refer to the `composer.sh` example script of how you can use this locally.


## Example

```shell
PHP=8.3 composer.sh show
```

## Supported versions

Please refer to the [Docker page](https://hub.docker.com/repository/docker/axllent/composer/tags) to see a list of supported PHP versions.
I only build images for PHP versions I need & use.
