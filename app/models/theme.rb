class Theme < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :links

  accepts_nested_attributes_for :links, allow_destroy: true

  scope :published, -> { where(published: true) }
end
