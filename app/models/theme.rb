class Theme < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title

  has_many :links

  accepts_nested_attributes_for :links, allow_destroy: true

  scope :published, -> { where(published: true) }
  paginates_per 1
end
