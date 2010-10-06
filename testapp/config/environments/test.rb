# Testapp::Application.configure do
#   # Settings specified here will take precedence over those in config/environment.rb
# 
#   # The test environment is used exclusively to run your application's
#   # test suite.  You never need to work with it otherwise.  Remember that
#   # your test database is "scratch space" for the test suite and is wiped
#   # and recreated between test runs.  Don't rely on the data there!
#   config.cache_classes = true
# 
#   # Log error messages when you accidentally call methods on nil.
#   config.whiny_nils = true
# 
#   # Show full error reports and disable caching
#   config.consider_all_requests_local       = true
#   config.action_controller.perform_caching = false
# 
#   # Raise exceptions instead of rendering exception templates
#   config.action_dispatch.show_exceptions = false
# 
#   # Disable request forgery protection in test environment
#   config.action_controller.allow_forgery_protection    = false
# 
#   # Tell Action Mailer not to deliver emails to the real world.
#   # The :test delivery method accumulates sent emails in the
#   # ActionMailer::Base.deliveries array.
#   config.action_mailer.delivery_method = :test
# 
#   # Use SQL instead of Active Record's schema dumper when creating the test database.
#   # This is necessary if your schema can't be completely dumped by the schema dumper,
#   # like if you have constraints or database-specific column types
#   # config.active_record.schema_format = :sql
# end

#this is copied from development.rb. Something in the above (old test.rb) was triggering a db read as soon as the test env was loaded (which interferes with rake task inkling:rebuild)
Testapp::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :stdout 
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
end
