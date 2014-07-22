# encoding: UTF-8

module ChiliPepper
  class MenuDecorator < Draper::Decorator
    delegate_all

    def display_price
        if price?
          euro_sign = h.content_tag(:span, '€', :class => euro_sign)
          price_to_display = h.number_to_currency(price, :unit => '')
          price_content = h.content_tag(:fiv, euro_sign + price_to_display, :id => 'big_price')
      end
    end

      def display_availability
        if availability?
          h.content_tag(:h2, availability, :class => 'menu_availibilities')
        end
      end
      
      def display_description
        if description?
          h.content_tag(:h3, h.markdown(description), :class => 'menu_description')
        end
      end
      
      # def header_img
      #   if menu_image?
      #     h.image_tag menu_image.url(), :style => "margin-top: #{menu_img_margin_top(menu_image.url)}"
      #   end
      # end
      
      def pdf_link
        if downloadable_pdf?
          link = h.link_to('Download PDF', downloadable_pdf.url, :onclick => "javascript: _gaq.push(['_trackPageview', '/downloads/#{slug}']);")
          h.content_tag(:p, link, :class => 'pdf_download')
        end   
      end
      
      # def footnotes
      #   return if menu_type == 'drinks'
        
      #   footnotes_class = "menu_footnotes"
        
      #   if menu_annotations.present?
      #     footnotes_class += ' with_supplements'
      #     section_content = health_footnotes + supplementary_footnotes_columns
          
      #   else
      #     footnotes_class += ' no_supplements'
      #     section_content = health_footnotes
      #   end
      #   h.content_tag(:section, section_content, :class => footnotes_class)
      # end
      
      private
        
      # def health_footnotes 
      #   list_content = ''
      #   health_footnotes = {'vegetarian' => 'Vegetarian Dish', 'coeliac' => 'Coeliac friendly', 'coeliac_option' => 'Coeliac Option available'}
      #   health_footnotes.each do |key, value|
      #     list_content << h.raw(h.content_tag(:li, h.content_tag(:span) + value, :class => key))
      #   end
      #   h.raw(h.content_tag(:ul, h.raw(list_content), :class => 'icons_legend'))
        
      # end
      
      # def supplementary_footnotes_columns
      #   supplementary_footnotes_columns = ''
      #   slice_num = (menu_annotations.size.to_f/2).ceil
      #   menu_annotations.each_slice(slice_num).with_index do |list,i|
      #     list_content = ''
      #     list.each {|ma| list_content << list_item(ma)}
      #     supplementary_footnotes_columns << h.content_tag(:ul, h.raw(list_content), class: "supplements_list_#{i+1}")
      #   end
        
      #   h.raw(supplementary_footnotes_columns)
      # end
      
      # def list_item(ma)
      #   h.content_tag(:li, h.content_tag(:span, ('*' * ma.position ), :class => 'dish_stars') + ma.description)
      # end
      
      # def menu_img_margin_top(img)
      #   require 'fastimage'
        
      #   # path = (Rails.root.to_s + '/public' + img).sub(/\?\d+$/, '')
      #   path = img
      #     dimensions = FastImage.size(path)
      #   if dimensions.present?
      #     height = dimensions[1]
      #     margin_top = ((126 - height) / 2).to_s + 'px'
      #   end
      # end
        
  end
end
