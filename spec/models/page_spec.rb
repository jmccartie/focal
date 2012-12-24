require 'spec_helper'

describe Page do
  before do
    @page = build(:page)
  end

  describe "validations" do
    it "is valid" do
      @page.should be_valid
    end

    %w[title body].each do |attr|
      it "errors if #{attr} is not present" do
        @page.send("#{attr}=", nil)
        @page.should have(1).error_on(attr.to_sym)
        @page.send("#{attr}=", "")
        @page.should have(1).error_on(attr.to_sym)
      end
    end

    it "errors if sort_order is not a number" do
      @page.sort_order = "someString"
      @page.should have(1).error_on(:sort_order)
    end
  end # validations

  describe "before_validation" do
    it "creates a slug" do
      @page.title = "My AWesome titLe"
      @page.slug = nil
      @page.valid?
      @page.slug.should == "my-awesome-title"
    end
  end

end
