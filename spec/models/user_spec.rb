require 'rails_helper'

describe User do
  describe "when ensuring that the user model is valid" do
    it "has a valid factory" do
      user = FactoryGirl.build(:user)
      expect(user).to be_valid
    end

    it "is invalid without an email" do
      user = FactoryGirl.build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it "the email has to be unique" do
      FactoryGirl.create(:user, email: "unique@example.com")
      user = FactoryGirl.build(:user, email: "unique@example.com")
      expect(user).to_not be_valid
    end

    it "is invalid without a password" do
      user = FactoryGirl.build(:user, password: nil)
      expect(user).to_not be_valid
    end
  end
end
