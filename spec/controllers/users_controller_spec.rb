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

  # Too much devise magic... but obvioulsy the is no create action in the UsersController
  #
  # describe "POST #create" do
  #   context "with valid attributes" do
  #     it "saves the new user in the database" do
  #       expect{ post :create, user: FactoryGirl.attributes_for(:user) }.to change(User,:count).by(1)
  #   end
  #     it "redirects to the home page" do
  #       post :create, user: FactoryGirl.attributes_for(:user)
  #       response.should redirect_to User.last
  #     end
  #   end

  #   context "with invalid attributes" do
  #     it "does not save the new user in the database" do
  #       expect{ post :create, user: FactoryGirl.attributes_for(:user, email: nil) }.to not_change(User,:count)
  #     end
  #     it "re-renders the :new template" do
  #       post :create, user: FactoryGirl.attributes_for(:user, email: nil)
  #       response.should redirect_to :users
  #     end
  #   end
  # end

end
