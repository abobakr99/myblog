class Article < ApplicationRecord
  #validations
  validates :title , presence: true
  validates :content, presence: true,  length: {minimum: 5 }
 
  #Associations
  belongs_to :user
  has_many :comments , dependent: :destroy
  has_many :bookmarks , dependent: :destroy
  has_rich_text :content

end