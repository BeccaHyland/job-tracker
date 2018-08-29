require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end
    it "has many contacts" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:contacts)
    end
  end

  describe 'class methods' do
    xit 'calculates top 3 companies by interest' do
      before(:each) do
        @category = Category.create(title: "Technology")

        @company1 = Company.create(name: "BestCompany")
        @company2 = Company.create(name: "GreatCompany")
        @company3 = Company.create(name: "PrettyGoodCompany")
        @company4 = Company.create(name: "DecentCompany")

        @job1 = company1.jobs.create(title: "Developer", level_of_interest: 5, city: "Denver", category: category)
        @job2 = company1.jobs.create(title: "Developer", level_of_interest: 4, city: "Denver", category: category)

        @job3 = company2.jobs.create(title: "Developer", level_of_interest: 4, city: "Denver", category: category)
        @job4 = company2.jobs.create(title: "Developer", level_of_interest: 3, city: "Denver", category: category)

        @job5 = company3.jobs.create(title: "Developer", level_of_interest: 3, city: "Denver", category: category)
        @job6 = company3.jobs.create(title: "Developer", level_of_interest: 3, city: "Denver", category: category)

        @job7 = company4.jobs.create(title: "Developer", level_of_interest: 3, city: "Denver", category: category)
        @job8 = company4.jobs.create(title: "Developer", level_of_interest: 2, city: "Denver", category: category)
      end
      expect(Company.first_in_interest).to eq(@company1)
      expect(Company.second_in_interest).to eq(@company2)
      expect(Company.third_in_interest).to eq(@company2)
    end
  end
end
