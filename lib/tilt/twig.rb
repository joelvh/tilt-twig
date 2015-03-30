require 'tilt'
require 'yaml'

module Tilt
  class TwigTemplate < Template
    def initialize_engine
      install_php_dependencies
    end

    def prepare; end

    def evaluate(scope, locals, &block)

      template_file = Tempfile.new(['template-', '.twig'])
      yaml_file     = Tempfile.new(['context-', '.yml'])
      yaml_data     = locals.merge(scope.is_a?(Hash) ? scope : {}).stringify_keys

      begin
        File.open(template_file.path, 'w'){|file| file.write(data)}
        File.open(yaml_file.path, 'w'){|file| file.write(yaml_data.to_yaml)}

        php_ini_path   = "#{gem_root_path}/php/php.ini"
        renderer_path  = "#{gem_root_path}/php/render.php"
        templates_path = File.dirname(template_file.path)
        template_name  = File.basename(template_file.path)
        yaml_dump_path = yaml_file.path

        result = `php --php-ini "#{php_ini_path}" "#{renderer_path}" "#{templates_path}" "#{template_name}" "#{yaml_dump_path}"`
      rescue
        raise
      ensure
        template_file.close
        template_file.unlink
        yaml_file.close
        yaml_file.unlink
      end
    end

    private
      def install_php_dependencies
        Dir.chdir(gem_root_path){`php php/install.php`}
      end

      def gem_root_path
        File.expand_path '../../..', __FILE__
      end
  end

  register 'twig', TwigTemplate
end

