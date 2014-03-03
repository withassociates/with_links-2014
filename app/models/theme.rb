class Theme < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  default_scope { order("issue_number DESC") }
  validates_presence_of :title

  has_many :links

  accepts_nested_attributes_for :links, allow_destroy: true

  scope :published, -> { where(published: true).order('issue_number DESC') }
  scope :ready_for_email, -> { where(ready_to_send: true).last }

  def previous
    self.class.published.where('issue_number < ?', self.issue_number).first
  end

  def next
    self.class.published.where('issue_number > ?', self.issue_number).last
  end

  def sent?
    sent_at.present?
  end

  def mark_as_sent!
    self.sent_at = Time.now
    save!
  end
end
