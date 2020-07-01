![](https://img.shields.io/badge/ruby-2.5%2B-red.svg)
![Gem Version](https://img.shields.io/gem/v/camaleon_image_optimizer.svg?colorB=blue)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)
[![Build Status](https://travis-ci.org/brian-kephart/camaleon_lazy_loader.svg?branch=master)](https://travis-ci.org/brian-kephart/camaleon_lazy_loader)

# CamaleonLazyLoader
This plugin adds a `loading="lazy"` attribute to `<img>` and `<iframe>` tags rendered by [Camaleon CMS](https://github.com/owen2345/camaleon-cms).
- This attribute will be added to tags on all server-rendered pages.
- Existing loading attributes will not be overwritten, so you can still set individual tags to `loading="eager"` or `loading="auto"`

## Usage
Just turn on the plugin in your admin settings.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'camaleon_lazy_loader'
```

And then execute:
```bash
$ bundle
```

## Contributing
- Fork the repo.
- Make your changes and add tests as necessary.
- Run `standardrb` to lint your code.
- Submit a pull request.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
