module ChiliPepper
  class Annotation < ActiveRecord::Base
    belongs_to :menu, touch: true
    has_many :items, dependent: :nullify
    acts_as_list scope: :menu
  end
end
