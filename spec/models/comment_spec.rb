require 'rails_helper'

describe Comment do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a body" do
        category = Category.create(title: "Finance")
        job = Job.create(title: "Turing", level_of_interest: 2, city: "Denver", category: category)
        comment = Comment.create()
        expect(comment).to be_invalid
      end
    end
    context 'valid attributes' do
      it 'is valid with a body' do
        category = Category.create(title: "Finance")
        company = Company.create(name: "High Jam")
        job = company.jobs.create(title: "Turing", level_of_interest: 2, city: "Denver", category: category)
        comment = job.comments.create(body: "Saweet happenings")
        expect(comment).to be_valid
      end
    end
  end
  describe "relationships" do
    it "belongs to a job" do
      category = Category.create(title: "Finance")
      company = Company.create(name: "High Jam")
      job = company.jobs.create(title: "Turing", level_of_interest: 2, city: "Denver", category: category)
      comment = job.comments.create(body: "Saweet happenings")
      expect(comment).to respond_to(:job)
    end
  end
end