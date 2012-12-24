require 'spec_helper'

describe User do
  before do
    @user = build(:user)
  end

  describe "validations" do
    it "is valid" do
      @user.should be_valid
    end
  end
end
