class User < ActiveRecord::Base
  has_many  :bicycles
  has_many  :reservations
  has_many   :locations
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true, uniqueness: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true

end
