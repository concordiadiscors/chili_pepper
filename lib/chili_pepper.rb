require 'devise'
require 'chili_pepper/engine'
require 'chili_pepper/configuration'

module ChiliPepper
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
