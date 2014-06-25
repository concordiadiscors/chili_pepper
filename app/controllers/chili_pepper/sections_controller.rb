require_dependency "chili_pepper/application_controller"

module ChiliPepper
  class SectionsController < ApplicationController
    before_action :authenticate_admin!, except: :show
    before_action :menu
    before_action :section, except: [:new, :create, :show]

    def show
      @all_menu_sections = @menu.sections.order('position').select('id, name, position, slug').decorate
      @section = Section.includes(:items).friendly.find(params[:id]).decorate
      @columns_number = 2
      @item_groups = @section.items.group_by(&:column)
      render layout: 'chili_pepper/menu'
    end

    def new
      @section = @menu.sections.build
    end

    def create
      @section = Section.new(section_params)
      if @section.save
        redirect_to menu_section_path(@menu, @section)
      else
        render action: :new
      end
    end

    def edit

    end

    def update
      if @section.update(section_params)
        redirect_to menu_section_path(@menu, @section)
      else
        render action: :edit
      end
    end

    def destroy
      @section.destroy
      redirect_to @menu
    end

    def sort
    end

    private

    def menu
      @menu = Menu.friendly.find(params[:menu_id]).decorate
    end

    def section
      @section = Section.friendly.find(params[:id]).decorate
    end

    def section_params
      params.require(:section).permit(:name, :description, :image, :menu_id)
    end
        

  end
end
