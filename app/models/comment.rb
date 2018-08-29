class Comment < ApplicationRecord
  validate :body
  belongs_to :job
end