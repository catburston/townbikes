require 'rails_helper'

describe UsersController do
  describe "GET #show" do
    it "assigns the requested user to @user" do
      user = FactoryGirl.create(:user)
      get :show, id: user
      assigns(:user).should eq(user)
    end
    it "renders the :show template" do
      get :show, id: FactoryGirl.create(:user)
      response.should render_template :show
    end
  end
end
