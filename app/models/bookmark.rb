class Bookmark < ApplicationRecord
  validates_uniqueness_of :user, scope: :article
  
  belongs_to :article
  belongs_to :user
end
