require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  describe "grams#index action" do
    it "should show the main page with a list of programming links submitted by users" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
