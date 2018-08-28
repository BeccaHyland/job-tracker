class Contact < ApplicationRecord
  validates :name, :position, :email, presence: true, uniqueness: true
  belongs_to :company
end