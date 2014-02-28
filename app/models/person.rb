class Person < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates_presence_of :name

  has_many :links

  def links_ordered_by_issue
    links.joins(:theme).order("themes.issue_number DESC")
  end
end
