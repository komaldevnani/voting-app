class Item < ApplicationRecord
  belongs_to :poll
  has_many :users, through: :votes
  has_many :votes, dependent: :destroy

  validates_presence_of :name
end