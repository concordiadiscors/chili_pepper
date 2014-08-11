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
require 'rails3-jquery-autocomplete'

module ChiliPepper


  class << self
       mattr_accessor :columns_number,
                      :menu_medium_image,
                      :restaurant_name,
                      :section_medium_image

       self.columns_number = 2
       self.menu_medium_image = '430x184>'
       self.section_medium_image = '530x230>'
       self.restaurant_name = 'Restaurant'

       # add default values of more config vars here
   end

    # this function maps the vars from your app into your engine
    def self.setup(&block)
       yield self
    end

  class Engine < ::Rails::Engine
    isolate_namespace ChiliPepper

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    # config.to_prepare do
    #   ApplicationController.helper(ActionView::Helpers::ApplicationHelper)
    # end



  end
end
