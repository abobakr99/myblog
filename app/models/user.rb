class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Model attribute validation
  validates :name , presence: true, length: {minimum:1,  maximum: 30}
  validates :email, presence: true
  #Associations
  has_many :articles, dependent: :destroy

end
