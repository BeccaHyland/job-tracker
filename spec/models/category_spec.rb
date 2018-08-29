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

    context "valid attributes" do
      it "is valid with a name" do
        category = Category.new(title: "Database Ops")
        expect(category).to be_valid
      end
    end
  end

  describe 'relationships' do
    category = Category.new(title: "Database Ops")
    it {should have_many(:jobs)}
  end
end
