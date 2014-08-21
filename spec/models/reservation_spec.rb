require 'rails_helper'

describe Reservation do
  describe "when ensuring that the reservation model is valid" do
    it "has a valid factory" do
      FactoryGirl.create(:reservation).should be_valid
    end
    it "is invalid without a reservation from_date" do
      FactoryGirl.build(:reservation, from_date: nil).should_not be_valid
    end
    it "is invalid if the from_date comes after the to_date" do
      FactoryGirl.build(:reservation, to_date: Date.new(2014, 10, 1)).should_not be_valid
    end
    it "is invalid without a bicycle_id" do
      FactoryGirl.build(:reservation, bicycle_id: nil).should_not be_valid
    end
    it "is invalid without a user_id" do
      FactoryGirl.build(:reservation, user_id: nil).should_not be_valid
    end
  end

  describe "when ensuring that the reservation model relationships are valid" do
    before do
      @user = FactoryGirl.create(:user)
      @bicycle = FactoryGirl.create(:bicycle)
      @location = FactoryGirl.create(:location, user_id: @user.id)
    end

    it "should add the bike to the reservation" do
      @reservation = FactoryGirl.create(:reservation, bicycle_id: @bicycle.id)
      expect(@bicycle.reservations.last).to eq @reservation
    end
  end
end
