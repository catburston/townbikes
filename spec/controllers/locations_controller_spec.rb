require 'rails_helper'

describe LocationsController do
  describe "GET #show" do
    it "assigns the requested location to @location" do
      location = FactoryGirl.create(:location)
      get :show, id: location
      assigns(:location).should eq(location)
    end
    it "renders the :show template" do
      get :show, id: FactoryGirl.create(:location)
      response.should render_template :show
    end
  end

  describe "POST #create" do
    before do
      @user = FactoryGirl.create(:user)
      @user.confirm!   # confirm user for devise, otherwise he can not sign in
      sign_in @user    # sign user in with devise, to create a current_user
    end

    context "with valid attributes" do
      it "saves the new location in the database" do
        expect{ post :create, user_id: @user.id, location: FactoryGirl.build(:location).attributes }.to change(Location,:count).by(1)
      end
    end
      it "redirects to the new location" do
        post :create, user_id: @user.id, location: FactoryGirl.build(:location).attributes
        response.should redirect_to Location.last
      end
    end
end
