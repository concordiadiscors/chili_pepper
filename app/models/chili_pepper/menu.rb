module ChiliPepper
  class Menu < ActiveRecord::Base
  	validates_presence_of :name
  	acts_as_list
  end
end
