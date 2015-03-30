require 'tilt/twig'
require 'middleman-core/templates'

# Twig Renderer
module Middleman
  module Renderers
    module Twig
      class << self
        def registered(app)
          app.before_configuration do
            template_extensions twig: :html
          end
          # Twig is not included in the default gems,
          # but we'll support it if available.

          # After config, setup mustache partial paths
          app.after_configuration do
            # Convert data object into a hash for twig
            sitemap.provides_metadata %r{\.twig$} do
              { :locals => { :data => data.to_h } }
            end
          end
        end

        alias :included :registered
      end
    end
  end
end
#Middleman::Templates.register :twig, Middleman::Renderers::Twig