require 'rails_helper'

describe BicyclesController do
  describe "GET #show" do
    it "assigns the requested bicycle to @bicycle" do
      bicycle = FactoryGirl.create(:bicycle)
      get :show, id: bicycle
      assigns(:bicycle).should eq(bicycle)
    end
    it "renders the :show template" do
      get :show, id: FactoryGirl.create(:bicycle)
      response.should render_template :show
    end
  end

  describe "POST #create" do
    before do
      @owner = FactoryGirl.create(:user)
      @owner.confirm!   # confirm user for devise, otherwise he can not sign in
      sign_in @owner    # sign user in with devise, to create a current_user
    end

    context "with valid attributes" do
      it "saves the new bicycle in the database" do
        expect{ post :create, user_id: @owner.id, bicycle: { bicycle_type: "fast", size: 20, daily_cost: 4 } }.to change(Bicycle,:count).by(1)
    end
      it "redirects to the new bicycle" do
        post :create, user_id: @owner.id, bicycle: { bicycle_type: "fast", size: 20, daily_cost: 4 }
        response.should redirect_to Bicycle.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new bicycle in the database" do
        expect{ post :create, user_id: @owner.id, bicycle: FactoryGirl.attributes_for(:bicycle, size: nil) }.to_not change(Bicycle,:count)
      end
      it "re-renders the :new template" do
        post :create, user_id: @owner.id, bicycle: FactoryGirl.attributes_for(:bicycle, size: nil)
        response.should render_template :new
      end
    end
  end

end
