require 'spec_helper'

describe Post do
  before do
    @post = build(:post)
  end

  describe "validations" do
    it "is valid" do
      @post.should be_valid
    end

    %w[title body].each do |attr|
      it "errors if #{attr} is not present" do
        @post.send("#{attr}=", nil)
        @post.should have(1).error_on(attr.to_sym)
        @post.send("#{attr}=", "")
        @post.should have(1).error_on(attr.to_sym)
      end
    end
  end # validations

  describe ".to_param" do
    it "returns a friendly URL" do
      @post.save!
      @post.title = "Awesome Title"
      @post.to_param.should == "#{@post.id}-awesome-title"
    end
  end

end
