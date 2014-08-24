require 'rails_helper'

describe Reservation do
  describe "when ensuring that the reservation model is valid" do
    before do
      @user = FactoryGirl.create(:user)
      @bicycle = FactoryGirl.create(:bicycle)
      @location = FactoryGirl.create(:location, user_id: @user.id)
    end

    it "has a valid factory" do
      @reservation = FactoryGirl.create(:reservation, user_id: @user.id)
      expect(@reservation).to be_valid
    end
    it "is invalid without a reservation from_date" do
      @reservation = FactoryGirl.build(:reservation, user_id: @user.id, from_date: nil)
      expect(@reservation).to_not be_valid
    end
    it "is invalid if the from_date comes after the to_date" do
      @reservation = FactoryGirl.build(:reservation, user_id: @user.id, to_date: Date.new(2014, 10, 1))
      expect(@reservation).to_not be_valid
    end
    it "is invalid without a bicycle_id" do
      @reservation = FactoryGirl.build(:reservation, user_id: @user.id, bicycle_id: nil)
      expect(@reservation).to_not be_valid
    end
    it "is invalid without a user_id" do
      @reservation = FactoryGirl.build(:reservation, user_id: @user.id, user_id: nil)
      expect(@reservation).to_not be_valid
    end
  end

  describe "when ensuring that the reservation model relationships are valid" do
    before do
      @user = FactoryGirl.create(:user)
      @bicycle = FactoryGirl.create(:bicycle)
      @location = FactoryGirl.create(:location, user_id: @user.id)
    end

    it "should add the bike to the reservation" do
      @reservation = FactoryGirl.create(:reservation, user_id: @user.id, bicycle_id: @bicycle.id)
      expect(@bicycle.reservations.last).to eq @reservation
    end
    it "should add the user to the reservation" do
      @reservation = FactoryGirl.create(:reservation, user_id: @user.id)
      expect(@user.reservations.last).to eq @reservation
    end
  end
end
