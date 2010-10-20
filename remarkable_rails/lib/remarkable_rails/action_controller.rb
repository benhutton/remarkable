module Remarkable
  module ActionController
  end
end

dir = File.dirname(__FILE__)
require File.join(dir, 'action_controller', 'base')
require File.join(dir, 'action_controller', 'macro_stubs')

# Load matchers
Dir[File.join(dir, 'action_controller', 'matchers', '*.rb')].each do |file|
  require file
end

# Include macro_stubs and matchers in Spec::Rails
if defined?(RSpec::Rails)
  RSpec::Rails::ControllerExampleGroup.send :include, Remarkable::ActionController::MacroStubs

  Remarkable.include_matchers!(Remarkable::ActionController, RSpec::Rails::ControllerExampleGroup)
  Remarkable.include_matchers!(Remarkable::ActionController, RSpec::Rails::RoutingExampleGroup)
end

