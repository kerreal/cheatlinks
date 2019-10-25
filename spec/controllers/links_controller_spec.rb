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
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "links#create action" do
    it "should successfully create a new link in our database" do
      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: { link: { title: 'Google', link: 'www.google.com', discription: 'Search the web!' } }
      expect(response).to redirect_to root_path

      link = Link.last
      expect(link.title).to eq("Google")
      expect(link.user).to eq(user)
    end

    it "should properly deal with validation errors" do
      user = FactoryBot.create(:user)
      sign_in user

      link_count = Link.count

      post :create, params: { link: { title: '', link: '', discription: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(link_count).to eq Link.count
    end
  end
end
