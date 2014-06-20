require_dependency "chili_pepper/application_controller"

module ChiliPepper
  class MenusController < ApplicationController

    before_action :authenticate_admin!, except: [:show, :index]
    
    def index
    end

    def show
      @menu = Menu.find_by_slug(params[:id]).decorate
      render :layout => 'chili_pepper/menu'
    end

    def new
        @menu = Menu.new()
    end

    def create
      @menu = Menu.new(menu_params)
      if @menu.save
        redirect_to :action => 'show', :id => @menu
        # set_annotations_positions(@menu)
        # clear_menu_caches
      else 
          render :action => 'new'
      end
    end

    def edit
      @menu = Menu.find_by_slug(params[:id])
    end

    def update
      @menu = Menu.find_by_slug(params[:id])
      if @menu.update(menu_params)
        redirect_to :action => 'show', :id => @menu
        # set_annotations_positions(@menu)
        # clear_menu_caches
      else 
          render :action => :edit
      end
    end

    def destroy
    end

    private

    def menu_params
      params.require(:menu).permit(:name, :description, :menu_type, :availability, :price, :published, :downloadable_pdf, :image)
  end
  end
end
