class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :polls, dependent: :destroy
  has_many :votes
  has_many :items, through: :votes

  def voted_for?(poll)
    items.any? {|v| v.poll == poll }
  end
end
