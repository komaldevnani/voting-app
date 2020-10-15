class Poll < ApplicationRecord
  validates_presence_of :title
  belongs_to :user
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: :true

  def votes_summary
    items.inject(0) {|summary, option| summary + option.votes.count}
  end
end
