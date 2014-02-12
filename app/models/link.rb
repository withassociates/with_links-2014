class Link < ActiveRecord::Base
  has_attached_file :icon, styles: {
    thumb: '100x100>'
  }

  validates_attachment_content_type :icon, :content_type => %w(image/jpeg image/jpg image/png image/gif image/svg+xml)
  # validates_presence_of :title

  belongs_to :person
  belongs_to :theme

  scope :top_10, -> { order("votes DESC").limit(10) }

  def vote_up!
    increment!(:votes)
  end
end
