module ChiliPepper
  class SectionDecorator < Draper::Decorator
    delegate_all
    decorates_association :items

    def show_section_header
      if description? || heading?
        header_content = ''
        header_content += h.content_tag(:h1, h.markdown(heading), class: 'menu_section_heading') if heading?
        header_content += h.image_tag(image.url(:medium), class: 'menu_section_image') if image?
        header_content += (h.content_tag :p, h.markdown(description), class: 'menu_section_description') if description?
        h.content_tag :section, h.raw(header_content), class: 'section_header'
      end
    end

    def admin_show_section_img
      h.image_tag(image.url(:thumb), class: 'menu_img_thumb') if section_image?
    end
  end
end
