module ChiliPepper
  module ApplicationHelper
    def markdown(text)
      renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
      options = {
        autolink: true,
        no_intra_emphasis: true
      }
      rtxt = Redcarpet::Markdown.new(renderer, options).render(text)
    matched_string = Regexp.new(/\A<p>(.*)<\/p>\Z/m).match(rtxt)
    return matched_string[1].html_safe if matched_string.present?
    end

    def cache_or_admin(fragment_name, &block_to_be_executed)
      if !admin_signed_in?
        cache(fragment_name) do
          block_to_be_executed.call
        end
      else
        block_to_be_executed.call
      end
    end

    def link_to_add_fields(name, f, association)
      new_object = f.object.send(association).klass.new
      id = new_object.object_id
      fields = f.fields_for(association, new_object, child_index: id) do |builder|
        render(association.to_s.singularize + "_fields", f: builder)
      end
      link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
    end
  end
end
