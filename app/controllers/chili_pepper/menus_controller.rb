require_dependency 'chili_pepper/application_controller'

module ChiliPepper
  class MenusController < ApplicationController
    before_action :authenticate_admin!, except: [:show, :index]
    before_action :menu, except: [:index, :new, :create, :sort]

    def index
      menu_type = params[:menu_type] || :food
      if admin_signed_in?
        @menu = Menu
                .where(menu_type: Menu.menu_types[menu_type])
                .first
        redirect_to @menu.present? ? @menu : new_menu_path
      else
        @menu = Menu.published
                .where(menu_type: Menu.menu_types[menu_type])
                .first
        redirect_to @menu.present? ? @menu : main_app.root_path
      end
    end

    def show
      @similar_menus = pick_similar_menus
      if @menu.sections.any?
        redirect_to menu_section_path(@menu, @menu.sections.position_sorted.first)
      else
        @section = ''
        render layout: 'chili_pepper/menu'
      end
    end

    def new
      menu_type = params[:menu_type] ||= 'food'
      @menu = Menu.new(menu_type: menu_type)
    end

    def create
      @menu = Menu.new(menu_params)
      if @menu.save
        redirect_to action: 'show', id: @menu
        # set_annotations_positions(@menu)
        clear_menu_caches
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @menu.update(menu_params)
        redirect_to action: 'show', id: @menu
        # set_annotations_positions(@menu)
        clear_menu_caches
      else
        render action: :edit
      end
    end

    def destroy
      @menu.destroy
      clear_menu_caches
      redirect_to action: :index
    end

    def sort
      params[:menu].each_with_index do |id, index|
        Menu.find(id).update_attributes(position: index + 1)
      end
      clear_menu_caches
      render nothing: true
    end

    def duplicate
      @menu.duplicate
      clear_menu_caches
      redirect_to menu_path(Menu.same_type_menus(@menu.menu_type).last)
    end

    private

    def clear_menu_caches
      Menu.all.each(&:touch)
    end

    def menu
      @menu = Menu.friendly.find(params[:id]).decorate
    end

    def pick_similar_menus
      if admin_signed_in?
        Menu.same_type_menus(@menu.menu_type)
      else
        Menu.published.same_type_menus(@menu.menu_type)
      end
    end

    def menu_params
      params.require(:menu) .permit(
        :name,
        :description,
        :menu_type,
        :availability,
        :price,
        :published,
        :downloadable_pdf,
        :image,
        annotations_attributes: [:id, :description, :_destroy]
        )
    end
  end
end
