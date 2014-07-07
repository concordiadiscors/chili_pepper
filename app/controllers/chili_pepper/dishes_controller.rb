require_dependency "chili_pepper/application_controller"

module ChiliPepper
  class DishesController < ApplicationController
    before_action :authenticate_admin!
    before_action :section, :menu, :except => [:autocomplete_dish_name]
    before_action :find_dish, :find_item, :except => [:new, :create, :autocomplete_dish_name]
    autocomplete :dish, :name, :class_name => "chili_pepper/dish" #, :display_value => :name_for_autocomplete

    def new
        @dish = Dish.new
        @item = @dish.items.build(:section_id => @section.id, :column => params[:column])
    end

    def create
      @dish = Dish.new(dish_params)
      if @dish.save!
        redirect_to_menu_section
      else 
        render action: :new
      end

    end

    def edit
    end

    def update
      if @dish.update(dish_params)
        redirect_to_menu_section
      else
        render action: :edit
      end
    end

    def destroy
      @dish.destroy
      redirect_to_menu_section
    end

    private

    def redirect_to_menu_section
      redirect_to menu_section_path(@menu, @section)
    end

    def find_dish
      @dish = Dish.find(params[:id])
    end

    def find_item
      @item = Item.find(params[:item_id])
    end

    def section
      @section = Section.find(params[:section_id])
    end

    def menu
      @menu = @section.menu
    end

    def dish_params
      params.require(:dish).permit(:name, :description, :picture, :coeliac, :vegetarian, :items_attributes => [:section_id, :price, :column, :dish_id, :id])
    end

  end
end
