require 'rails_helper'

describe ReservationsController do
  describe "GET #show" do
    before do
      @renter = FactoryGirl.create(:user)
      @owner = FactoryGirl.create(:user)
      @bicycle = FactoryGirl.create(:bicycle, user_id: @owner.id)
      @renter.confirm!   # confirm user for devise, otherwise he can not sign in
      sign_in @renter    # sign user in with devise, to create a current_user
    end

    it "assigns the requested reservation to @reservation" do
      reservation = FactoryGirl.create(:reservation)
      get :show, id: reservation
      get(:show, {'id' => reservation})
      assigns(:reservation).should eq(reservation)
    end
    it "renders the :show reservation template" do
      get :show, id: FactoryGirl.create(:reservation)
      response.should render_template :show
    end
  end

  describe "POST #create" do
    before do
      @renter = FactoryGirl.create(:user)
      @owner = FactoryGirl.create(:user)
      @bicycle = FactoryGirl.create(:bicycle, user_id: @owner.id)
      @renter.confirm!   # confirm user for devise, otherwise he can not sign in
      sign_in @renter    # sign user in with devise, to create a current_user
    end

    context "with valid attributes" do
      it "saves the new reservation in the database" do
        expect{ post :create, user_id: @renter.id, reservation: { from_date: Date.new(2014, 10, 1), to_date: Date.new(2014, 10, 12), user_id: @renter.id, bicycle_id: @bicycle.id } }.to change(Reservation,:count).by(1)
    end
      it "redirects to the new reservation" do
        post :create, user_id: @renter.id, reservation: { from_date: Date.new(2014, 10, 1), to_date: Date.new(2014, 10, 12), user_id: @renter.id, bicycle_id: @bicycle.id }
        response.should redirect_to Reservation.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new reservation in the database" do
        expect{ post :create, user_id: @renter.id, reservation: FactoryGirl.attributes_for(:reservation, from_date: nil, bicycle_id: @bicycle.id) }.to_not change(Reservation,:count)
      end
      it "re-renders the :new reservation template" do
        post :create, user_id: @renter.id, reservation: FactoryGirl.attributes_for(:reservation, from_date: nil, bicycle_id: @bicycle.id)
        response.should render_template :new
      end
    end
  end

end
