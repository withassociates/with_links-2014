class Link < ActiveRecord::Base
  has_attached_file :icon

  belongs_to :person
  belongs_to :theme
end
