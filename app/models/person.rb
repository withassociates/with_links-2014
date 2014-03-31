class Person < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates_presence_of :name

  has_many :links

  scope :with_employee, -> { where(is_guest: nil) }
  scope :guest, -> { where(is_guest: true) }
  scope :alphabetical, -> { order("name ASC") }

  def links_ordered_by_issue
    links.joins(:theme).order("themes.issue_number DESC")
  end
end
