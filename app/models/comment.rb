class Comment < ApplicationRecord
  validates :body
  belongs_to :job
end