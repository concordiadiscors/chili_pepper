require_dependency "chili_pepper/application_controller"

module ChiliPepper
  class DishesController < ApplicationController
    before_action :authenticate_admin!
    before_action :section, :menu

    def new
        @dish = Dish.new
        @item = @dish.items.build(:section_id => @section.id)
    end

    def create
      @dish = Dish.new(section_params)
      if @dish.save
        redirect_to menu_section_path(@menu, @section)
      else 
        render :action => 'new'
      end

    end

    def edit
    end

    def update
    end

    def destroy

        
    end

    private



    def section
      @section = Section.friendly.find(params[:section_id])
    end

    def menu
      @menu = @section.menu
    end

    def section_params
      params.require(:dish).permit(:name, :description, :picture, :coeliac, :vegetarian)
    end

  end
end
