class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.first_in_interest
    #for each company, get the average of their jobs' level_of_interest
    #order by the average ascending
    #take the last company

    .select('companies.*, avg(jobs.level_of_interest) AS avg_interest')
    .joins(:jobs)
  #.group ?
  #.order by average score ASC
  #get the last one
  end

end
