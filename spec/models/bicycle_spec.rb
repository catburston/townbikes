require 'rails_helper'

describe Bicycle do
  describe "when ensuring that the bicycle model is valid" do
    it "has a valid factory" do
      FactoryGirl.create(:bicycle).should be_valid
    end
    it "is invalid without a bicycle type" do
      FactoryGirl.build(:bicycle, bicycle_type: nil).should_not be_valid
    end
    it "is invalid without a size" do
      FactoryGirl.build(:bicycle, size: nil).should_not be_valid
    end
    it "is invalid without a daily cost" do
      FactoryGirl.build(:bicycle, daily_cost: nil).should_not be_valid
    end
    it "is invalid without a user_id" do
      FactoryGirl.build(:bicycle, user_id: nil).should_not be_valid
    end
  end

  describe "when ensuring that the bicycle model relationships are valid" do
    before do
      @user = FactoryGirl.create(:user)
      @location = FactoryGirl.create(:location, user_id: @user.id)
    end

    it "should add the bike to the user" do
      bike = FactoryGirl.create(:bicycle, user_id: @user.id)
      expect(bike.user).to eq @user
    end
    it "should add the bike to the users location" do
      bike = FactoryGirl.create(:bicycle, user_id: @user.id)
      expect(bike.location).to eq @location
    end
    it "should add the bike to the reservation" do
      bike = FactoryGirl.create(:bicycle, user_id: @user.id)
      @reservation = FactoryGirl.create(:reservation)
      expect(bike.reservations.last).to eq @reservation
    end
  end
end
