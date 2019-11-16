# Docker and GitHub Actions for Composer

[![GitHub Release][ico-release]][link-github-release]
[![License][ico-license]](LICENSE)

GitHub Actions for [Composer](https://getcomposer.org). Base on Docker official [Composer](https://hub.docker.com/_/composer) image, and installed [hirak/prestissimo](https://github.com/hirak/prestissimo) package.

[ico-release]: https://img.shields.io/github/tag/MilesChou/composer-action.svg
[ico-license]: https://img.shields.io/badge/license-MIT-brightgreen.svg
[link-github-release]: https://github.com/MilesChou/composer-action/releases

## Usage

Via GitHub Workflow

```yaml
- uses: MilesChou/composer-action@master
  with:
    args: install
```

## Credits

* [MilesChou](https://github.com/MilesChou)

## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
