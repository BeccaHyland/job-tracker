class Contact < ApplicationRecord
  validates :name, :position, :email
  belongs_to :company
end