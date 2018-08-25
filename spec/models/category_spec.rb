require "rails_helper"

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        category = Category.new()
        expect(category).to be_invalid
      end

      it "has a unique name" do
        Category.create(title: "Database Ops")
        category = Category.new(title: "Database Ops")
        expect(category).to be_invalid
      end
    end
  end
end
