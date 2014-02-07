class Theme < ActiveRecord::Base
  has_many :links

  accepts_nested_attributes_for :links, allow_destroy: true

  scope :published, -> { where(published: true) }
end
