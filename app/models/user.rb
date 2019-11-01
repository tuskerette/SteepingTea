class User < ActiveRecord::Base
  has_many :songs, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
