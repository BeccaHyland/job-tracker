require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        contact = Contact.new(position: "Sales Manager", email: "yogibear@cartoon.com")
        expect(contact).to be_invalid
      end

      it 'is invalid without a position' do
        contact = Contact.new(name: "Susan", email: "yogibear@cartoon.com")
        expect(contact).to be_invalid
      end

      it 'is invalid without an email' do
        contact = Contact.new(name: "Susan", position: "Sales Manager")
        expect(contact).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a name, position, email, and company' do
        company = Company.create!(name: "Turing")
        #contact = Contact.new(name: "Susan", position: "Sales Manager", email: "yogibear@cartoon.com")
        contact = company.contacts.create(name: "Susan", position: "Sales Manager", email: "yogibear@cartoon.com")
        expect(contact).to be_valid
      end
    end
  end
  describe "relationships" do
    it "belongs to a company" do
      company = Company.new(name: "Turing")
      contact = Contact.new(name: "Susan", position: "Sales Manager", email: "yogibear@cartoon.com")
      expect(contact).to respond_to(:company)
    end
  end
end