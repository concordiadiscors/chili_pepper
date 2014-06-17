require 'spec_helper'

module ChiliPepper
  RSpec.describe MenusController, :type => :controller do


    describe "GET 'show'" do
      it "returns http success" do
        get 'show', :use_route => :chili_pepper
        expect(response).to be_success
      end
    end

    # describe "GET 'new'" do
    #   it "returns http success" do
    #     login_admin
    #     get 'new', :use_route => :chili_pepper
    #     expect(response).to be_success
    #   end
    # end

    # describe "GET 'create'" do
    #   it "returns http success" do
    #     get 'create', :use_route => :chili_pepper
    #     expect(response).to be_success
    #   end
    # end

    # describe "GET 'edit'" do
    #   it "returns http success" do
    #     login_admin
    #     get 'edit', :use_route => :chili_pepper
    #     expect(response).to be_success
    #   end
    # end

    # describe "GET 'update'" do
    #   it "returns http success" do
    #     get 'update', :use_route => :chili_pepper
    #     expect(response).to be_success
    #   end
    # end

    # describe "GET 'destroy'" do
    #   it "returns http success" do
    #     get 'destroy', :use_route => :chili_pepper
    #     expect(response).to be_success
    #   end
    # end

  end
end
