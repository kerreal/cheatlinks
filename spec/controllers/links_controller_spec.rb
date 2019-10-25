require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  describe "links#index action" do
    it "should show the main page with a list of programming links submitted by users" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "links#new action" do
    it "should successfully show a new form" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "links#create action" do
    it "should successfully create a new gram in our database" do
      post :create, params: { link: { title: 'Google', link: 'www.google.com', discription: 'Search the web!' } }
      expect(response).to redirect_to root_path

      link = Link.last
      expect(link.title).to eq("Google")
    end
  end
end
