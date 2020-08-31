class Comment < ApplicationRecord
  validates :body, presence: true,  length: {minimum: 1 }
  belongs_to :user
  belongs_to :article
end
