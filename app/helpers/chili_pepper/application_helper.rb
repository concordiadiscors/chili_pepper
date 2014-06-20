module ChiliPepper
  module ApplicationHelper
      def markdown(text)
        renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
        options = {
          autolink: true,
          no_intra_emphasis: true
        }
        rtxt = Redcarpet::Markdown.new(renderer, options).render(text)
      return Regexp.new(/\A<p>(.*)<\/p>\Z/m).match(rtxt)[1].html_safe
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
  end
end
