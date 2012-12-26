require 'spec_helper'

describe Status do
  before do
    @status = build(:status)
  end

  describe "validations" do
    it "is valid" do
      @status.should be_valid
    end

    it "errors if body is blank" do
      @status.body = nil
      @status.should have(1).error_on(:body)
      @status.body = ""
      @status.should have(1).error_on(:body)
    end
  end
end
