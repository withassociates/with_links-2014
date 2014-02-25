class Link < ActiveRecord::Base
  has_attached_file :icon, styles: { thumb: '100x100>' }
  validates_attachment_content_type :icon,
    content_type: %w(image/jpeg image/jpg image/png image/gif image/svg+xml)

  belongs_to :person
  belongs_to :theme

  scope :top_10, -> { order("votes DESC").limit(10) }
  paginates_per 1

  def vote_up!
    increment!(:votes)
  end

  def icon_attribution_file=(file)
    self.icon_attribution = file.read[/^ {4}(.+?)$/m, 1]
  end
end
