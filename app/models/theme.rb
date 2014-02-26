class Theme < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title

  has_many :links

  accepts_nested_attributes_for :links, allow_destroy: true

  scope :published, -> { where(published: true).order('issue_number DESC') }

  def previous
    self.class.published.where('issue_number < ?', self.issue_number).first
  end

  def next
    self.class.published.where('issue_number > ?', self.issue_number).last
  end
end
