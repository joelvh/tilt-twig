# Require core library
require 'middleman-core'
require 'middleman/renderers/twig'

# Extension namespace
module Middleman
  class TwigExtension < ::Middleman::Extension
    #option :my_option, 'default', 'An example option'

    def initialize(app, options_hash={}, &block)
      # Call super to build options from the options_hash
      super

      # Require libraries only when activated
      # require 'necessary/library'

      # set up your extension
      # puts options.my_option

      app.register Middleman::Renderers::Twig
    end

    def after_configuration
      # Do something
    end

    # A Sitemap Manipulator
    # def manipulate_resource_list(resources)
    # end

    # module do
    #   def a_helper
    #   end
    # end
  end
end

# Register extensions which can be activated
# Make sure we have the version of Middleman we expect
# Name param may be omited, it will default to underscored
# version of class name

Middleman::Extensions.register(:twig_extension, Middleman::TwigExtension)
