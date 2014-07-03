require_dependency "chili_pepper/application_controller"

module ChiliPepper
  class ItemsController < ApplicationController
    def sort
      if params[:item].present?
      params[:item].compact.each_with_index do |item, index|
        item = Item.find(item_id(item))
        item.update_attributes(position: index + 1, column: (params[:column_number].to_i - 1))
      end
      Item.find(item_id(params[:item].first)).section.touch
    end
    render nothing: true


    end

    def destroy
      @item = Item.find(params[:id])
      @section = @item.section
      @item.destroy
      redirect_to menu_section_path(@section.menu, @section)

    end

    private

    def item_id(array_item)
      array_item.sub(/item_/, '').to_i
    end

  end
  
end
