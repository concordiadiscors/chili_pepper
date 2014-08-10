# encoding: UTF-8

module ChiliPepper
  class ItemDecorator < Draper::Decorator
    delegate_all
    def show_dish_name
      dish.name
    end

    # def photo_featured_class
    #   'dish_photo_featured' if image_featured?
    # end

    # def show_item_photograph
    #   if image_featured?
    #     link_to image_tag(dish.dish_photo.url(:medium), alt: dish.name, height: 144, width: 310), item_path, remote: true, class: 'load_window', title: dish.name

    #   end
    # end

    def show_price
      if price?
        h.content_tag(:span, h.number_to_currency(price, unit: '€'), class: 'dish_price')
      end
    end

    def show_annotation
      if annotation.present?
        h.content_tag(:span, annotation.description, class: 'annotation')
      end
    end

    def show_description
      if dish.description?
        h.content_tag(:p, h.markdown(dish.description), class: 'dish_description')
      end
    end

    def show_extra_informations
      extras = []

      unless dish.not_coeliac_friendly? || dish.coeliac.blank?
        extras << h.content_tag(:li, dish.coeliac.humanize, class: dish.coeliac)
      end

      if dish.vegetarian?
        extras << h.content_tag(:li, 'Suitable for Vegetarian', class: 'vegetarian')
      end

      # if dish.dish_photo?
      #   photo = TRUE
      #    extras << h.content_tag(:li, link_to('Photo available', item_path, remote: true, class: 'load_window'), class: 'dish_photo_link')
      # end

      if dish.coeliac_friendly? || dish.coeliac_option_available? || dish.vegetarian? # || photo
        h.content_tag(:ul, h.raw(extras.join("\n")), class: 'extra_informations')
      end
    end
  end
end
