module ChiliPepper
  class Configuration
    attr_accessor :username, :password

    def initialize(args={})
        @generic_title = args[:generic_title]
    end
  end
end