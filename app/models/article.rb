class Article < ApplicationRecord
  #validations
  validates :title , presence: true
  validates :text, presence: true,  length: {minimum: 5 }
  #Associations
  belongs_to :user

end