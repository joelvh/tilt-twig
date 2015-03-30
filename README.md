# Tilt::Twig

**WARNING: EXPERIMENTAL**

This gem allows you to compile Twig templates within Ruby applications that support Tilt templates. This is currently not a native Ruby parser, but rather utilizes PHP command line to compile Twig templates. Data is serialized to YAML in your Ruby application and deserialized in a PHP script that passes the context to Twig.

## Installation

This gem has PHP dependencies, which are attempted to be [installed automatically](php/install.php):

* PECL
* `libyaml` (via [Homebrew](http://brew.sh))
* PHP's `yaml`
* [Composer](https://getcomposer.org)

Add this line to your application's Gemfile:

    gem 'tilt-twig'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tilt-twig

### Middleman

A [Middleman](http://middlemanapp.com) extension is built-in.

    gem 'tilt-twig', require: 'middleman/twig'

Add the extension to the Middleman configuration:

```ruby
configure :build do
  activate :twig_extension
end
```