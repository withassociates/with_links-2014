class Link < ActiveRecord::Base
  has_attached_file :icon, styles: {
    thumb: '100x100>'
  }

  validates_attachment_content_type :icon, :content_type => %w(image/jpeg image/jpg image/png image/gif)

  belongs_to :person
  belongs_to :theme

  def vote_up!
    increment!(:votes)
  end
end
