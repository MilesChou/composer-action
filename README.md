# Docker and GitHub Actions for Composer

[![GitHub Release][ico-release]][link-github-release]
[![License][ico-license]](LICENSE)

![Testing](https://github.com/MilesChou/composer-action/workflows/Testing/badge.svg)

GitHub Actions for [Composer](https://getcomposer.org). Base on Docker official [PHP](https://hub.docker.com/_/php) image, and installed [hirak/prestissimo](https://github.com/hirak/prestissimo) package. 

[ico-release]: https://img.shields.io/github/tag/MilesChou/composer-action.svg
[ico-license]: https://img.shields.io/badge/license-MIT-brightgreen.svg
[link-github-release]: https://github.com/MilesChou/composer-action/releases

## Why build another one image?

Actually, I want to follow DRY principle and use official [Composer](https://hub.docker.com/_/composer) image. But see the following composer.json:

```json
{
    "require": {
        "php": ">=5.5.9"
    },
    "require-dev": {
        "phpunit/phpunit": "^4 | ^5 | ^6"
    }
}
```

And use the following workflow:

```yaml
- name: Composer install
  uses: docker://composer:1.9.1
  with:
    args: install
- name: PHPUnit testing
  uses: docker://php:5.5
  with:
    args: php vendor/bin/phpunit
```

It's expected to work on PHP 5.5 ~ 7.3, so we should test on every platform. However, Composer image will install on PHP 7.3 platform and it will install PHPUnit 6.x. It will failed on PHP 5.5 container for PHPUnit 6.x require [PHP ^7.0](https://packagist.org/packages/phpunit/phpunit#6.0.0).   

Of course, we can use the `config.platform.php` config to force platform version on PHP 5.5 and it will install PHPUnit 4.x, but PHPUnit 4.x use too many deprecated functions, e.g. [each()](https://www.php.net/manual/en/function.each.php), so that cannot work on PHP >=7.2.

Finally, I think that build image on every version is the good idea.

## Usage for GitHub Actions

Via GitHub Workflow

```yaml
- uses: MilesChou/composer-action@master
  with:
    args: install
```

Use install image

```yaml
- uses: MilesChou/composer-action/install@master
```

With specify PHP version

```yaml
- uses: MilesChou/composer-action/5.5/install@master
```

## Usage for Docker

See [Docker Hub](https://hub.docker.com/r/mileschou/composer/)

## Supported tags and respective `Dockerfile` links

* [`7.4` (7.4/Dockerfile)](https://github.com/MilesChou/composer-action/blob/master/7.4/Dockerfile)
* [`7.3` (7.3/Dockerfile)](https://github.com/MilesChou/composer-action/blob/master/7.3/Dockerfile)
* [`7.2` (7.2/Dockerfile)](https://github.com/MilesChou/composer-action/blob/master/7.2/Dockerfile)
* [`7.1` (7.1/Dockerfile)](https://github.com/MilesChou/composer-action/blob/master/7.1/Dockerfile)
* [`7.0` (7.0/Dockerfile)](https://github.com/MilesChou/composer-action/blob/master/7.0/Dockerfile)
* [`5.6` (5.6/Dockerfile)](https://github.com/MilesChou/composer-action/blob/master/5.6/Dockerfile)
* [`5.5` (5.5/Dockerfile)](https://github.com/MilesChou/composer-action/blob/master/5.5/Dockerfile)

The following is built-in tools:

* git
* zip
* [hirak/prestissimo](https://github.com/hirak/prestissimo)

## Credits

* [MilesChou](https://github.com/MilesChou)

## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
