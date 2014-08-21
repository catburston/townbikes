require 'rails_helper'

describe Location do
  describe "when ensuring that the location model is valid" do
    it "has a valid factory" do
      FactoryGirl.create(:location).should be_valid
    end
    it "is invalid without a user" do
      location  = FactoryGirl.create(:location)
      location.user_id = nil
      location.should_not be_valid
    end
  end

  describe "when ensuring that the location model relationships are valid" do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "should add the location to the user" do
      @location = FactoryGirl.create(:location, user_id: @user.id)
      expect(@location.user).to eq @user
    end
  end
end
