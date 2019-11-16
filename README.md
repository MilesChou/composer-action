# Docker and GitHub Actions for Composer

[![GitHub Release][ico-release]][link-github-release]
[![License][ico-license]](LICENSE)

GitHub Actions for [Composer](https://getcomposer.org). Base on Docker official [Composer](https://hub.docker.com/_/composer) image, and installed [hirak/prestissimo](https://github.com/hirak/prestissimo) package.

[ico-release]: https://img.shields.io/github/tag/MilesChou/composer-action.svg
[ico-license]: https://img.shields.io/badge/license-MIT-brightgreen.svg
[link-github-release]: https://github.com/MilesChou/composer-action/releases

## Usage for GitHub Actions

Via GitHub Workflow

```yaml
- uses: MilesChou/composer-action@master
  with:
    args: install
```

## Usage for Docker

See [Docker Hub](https://hub.docker.com/r/mileschou/composer/)

## Supported tags and respective `Dockerfile` links

* [`7.3` (7.3/Dockerfile)](https://github.com/MilesChou/composer-action/blob/master/7.3/Dockerfile)
* [`7.2` (7.2/Dockerfile)](https://github.com/MilesChou/composer-action/blob/master/7.2/Dockerfile)
* [`7.1` (7.1/Dockerfile)](https://github.com/MilesChou/composer-action/blob/master/7.1/Dockerfile)
* [`7.0` (7.0/Dockerfile)](https://github.com/MilesChou/composer-action/blob/master/7.0/Dockerfile)
* [`5.6` (5.6/Dockerfile)](https://github.com/MilesChou/composer-action/blob/master/5.6/Dockerfile)
* [`5.5` (5.5/Dockerfile)](https://github.com/MilesChou/composer-action/blob/master/5.5/Dockerfile)

## Credits

* [MilesChou](https://github.com/MilesChou)

## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
