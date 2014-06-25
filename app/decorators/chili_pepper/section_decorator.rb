module ChiliPepper
  class SectionDecorator < Draper::Decorator
    include Draper::LazyHelpers
    delegate_all

    def show_section_description
      if description?
        h.content_tag(:p, h.markdown(description), :class => 'menu_section_description')
      end
    end

    def admin_show_section_img
      if section_image?
        h.image_tag image.url(:thumb), :class => 'menu_img_thumb'
      end
    end

  end
end
