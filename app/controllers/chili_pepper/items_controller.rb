require_dependency "chili_pepper/application_controller"

module ChiliPepper
  class ItemsController < ApplicationController
    def sort
    end

    def destroy
      @item = Item.find(params[:id])
      @section = @item.section
      @item.destroy
      redirect_to menu_section_path(@section.menu, @section)

    end
  end
  
end
