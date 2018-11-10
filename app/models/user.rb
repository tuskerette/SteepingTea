class User < ActiveRecord::Base
  has_many :songs

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
