class Poll < ApplicationRecord
  validates_presence_of :title
  belongs_to :user
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items
  validates_presence_of :items

  def votes_count
    items.inject(0) {|total, option| total + option.votes.count}
  end

  def votes_summary
    summary = {}
    items.each do |option|
      summary[option.name] = option.votes.count
    end
    summary
  end
end
