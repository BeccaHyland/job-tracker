class Category < ApplicationRecord
  validates :title, presence: true
  has_many :jobs, dependent: :destroy
end
