# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tilt/twig/version'

Gem::Specification.new do |spec|
  spec.name          = "tilt-twig"
  spec.version       = Tilt::Twig::VERSION
  spec.authors       = ["Joel Van Horn"]
  spec.email         = ["joel@joelvanhorn.com"]
  spec.summary       = %q{Compile Twig templates with Tilt and PHP}
  spec.description   = %q{This gem allows you to compile Twig templates within Ruby applications that support Tilt templates. This is currently not a native Ruby parser, but rather utilizes PHP command line to compile Twig templates. Data is serialized to YAML in your Ruby application and deserialized in a PHP script that passes the context to Twig.}
  spec.homepage      = "http://github.com/joelvh/tilt-twig"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
