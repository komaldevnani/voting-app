class Poll < ApplicationRecord
  validates_presence_of :title
  belongs_to :user
  has_many :items, dependent: :destroy
end
