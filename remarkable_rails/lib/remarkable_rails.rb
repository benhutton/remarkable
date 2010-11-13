# Load Remarkable
require 'remarkable/core'

# Load spec/rails
# require 'rspec/rails'

# Load Remarkable Rails base files
dir = File.dirname(__FILE__)
require File.join(dir, 'remarkable_rails', 'active_orm')
require File.join(dir, 'remarkable_rails', 'action_controller')
require File.join(dir, 'remarkable_rails', 'action_view')

# Load locale file
Remarkable.add_locale File.join(dir, '..', 'locale', 'en.yml')
# Load plugin files if RAILS_ROOT is defined. It loads files at:
#
#   RAILS_ROOT/spec/remarkable
#   RAILS_ROOT/vendor/gems/*/remarkable
#   RAILS_ROOT/vendor/plugins/*/remarkable
#
# Remarkable will load both ruby files (.rb) and Remarkable locale files (.yml).
#
# The only step remaining is to include the matchers, which Remarkable will not
# do automatically if the user is not using a Remarkable namespace. For example,
# if the developer includes his matchers to Remarkable::ActiveRecord::Matchers,
# the matchers will be automatically available in users spec. But if he creates
# a new namespace, like MyPlugin::Matchers, he has to tell Remarkable to include
# them in the proper example group:
#
#   Remarkable.include_matchers!(MyPlugin::Matchers, Spec::Rails::Example::ModelExampleGroup)
#
if defined?(Rails.root)
  files = []
  files += Dir.glob(File.join(Rails.root, "spec", "remarkable", "*"))
  files += Dir.glob(File.join(Rails.root, "vendor", "{plugins,gems}", "*", "remarkable", "*"))
  files.each do |file|
    begin
      case File.extname(file)
        when ".rb"
          require file
        when ".yml"
          Remarkable.add_locale file
      end
    rescue Exception => e
      warn "[WARNING] Remarkable could not load file #{file.inspect}. Error: #{e.message}"
    end
  end
end
