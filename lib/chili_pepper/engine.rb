require 'rubygems'
require 'acts_as_list'
require 'friendly_id'
require 'paperclip'
require 'haml-rails'
require 'simple_form'
require 'draper'
require 'redcarpet'
require 'jquery-rails'
require 'jquery-ui-rails'

module ChiliPepper
  class Engine < ::Rails::Engine
    isolate_namespace ChiliPepper

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
  end
end
