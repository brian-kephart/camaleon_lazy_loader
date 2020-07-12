![](https://img.shields.io/badge/ruby-2.5%2B-red.svg)
![Gem Version](https://img.shields.io/gem/v/camaleon_image_optimizer.svg?colorB=blue)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)
[![Build Status](https://travis-ci.com/brian-kephart/camaleon_lazy_loader.svg?branch=master)](https://travis-ci.org/brian-kephart/camaleon_lazy_loader)

# CamaleonLazyLoader
This plugin adds a `loading="lazy"` attribute to `<img>` and `<iframe>` tags rendered by [Camaleon CMS](https://github.com/owen2345/camaleon-cms).
- This attribute will be added to tags on all server-rendered pages.
- Existing loading attributes will not be overwritten, so you can still set individual tags to `loading="eager"` or `loading="auto"`

## How it works
This plugin updates the body of the http response using the `front_after_load` hook provided by Camaleon, unless the page is cached with the Front Cache plugin. Nokogiri is used to add the `loading` attribute.

### If the Front Cache plugin is active
- For pages that are not cached, this plugin works as described above.
- For pages that are cached:
    - The affects of this plugin are applied to the cache entry when it is saved using the `front_cache_writing_cache` hook.
    - There is no processing when reading from the cache.
- Activating/deactivating this plugin will clear the Front Cache.

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

## Limitations
This gem uses Nokogiri, which in turn wraps underlying parsers. Some characters can be altered by these parsers when used in element attributes. Known cases include:
- The AMP lightning bolt ⚡
- Characters that are escaped in HTML, such as endash or ampersand

## Contributing
- Fork the repo.
- Make your changes and add tests as necessary. (Run tests with `rails test`)
- Run `standardrb` to lint your code.
- Submit a pull request.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
