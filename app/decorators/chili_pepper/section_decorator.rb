module ChiliPepper
  class SectionDecorator < Draper::Decorator
    include Draper::LazyHelpers
    delegate_all

  end
end
