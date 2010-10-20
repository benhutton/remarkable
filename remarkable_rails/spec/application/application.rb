# Create an application controller to satisfy rspec-rails, a dummy controller
# and define routes.
#
class ApplicationController < ActionController::Base
end

class Task; end

# Define routes
Rails.application.routes.draw do 
  resources :projects do
    resources :tasks
  end
  match ':controller(/:action(/:id(.:format)))'
end

