class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.sort_by_location
    Job.order(city: :asc)
  end

  def self.sort_by_interest
    Job.order(level_of_interest: :desc)
  end
end
