require_dependency "chili_pepper/application_controller"

module ChiliPepper
  class MenusController < ApplicationController

    before_action :authenticate_admin!, except: [:show, :index]
    
    def index
    end

    def show
    end

    def new
        @menu = Menu.new()
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end
  end
end
