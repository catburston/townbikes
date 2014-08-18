require 'spec_helper'
require 'factory_girl_rails'

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
  end
end