require 'spec_helper'
require 'factory_girl_rails'

describe User do
  describe "when ensuring that the user model is valid" do
    it "has a valid factory" do
      FactoryGirl.create(:user).should be_valid
    end
    it "is invalid without an email" do
      FactoryGirl.build(:user, email: nil).should_not be_valid
    end
    it "is invalid without a firstname" do
      FactoryGirl.build(:user, first_name: nil).should_not be_valid
    end
    it "is invalid without a lastname" do
      FactoryGirl.build(:user, last_name: nil).should_not be_valid
    end
  end
end