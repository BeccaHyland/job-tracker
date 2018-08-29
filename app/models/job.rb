class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.sort_by_location(location)
    Job.sort(location: :asc)
  end

  def self.sort_by_interest
    Job.sort(level_of_interest: :asc)
  end
end
