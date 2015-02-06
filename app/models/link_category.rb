class LinkCategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :links

  scope :alphabetical, -> { order("name ASC") }
end
