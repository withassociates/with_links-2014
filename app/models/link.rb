class Link < ActiveRecord::Base
  before_save :set_issue_number

  has_attached_file :icon, styles: { thumb: '100x100>' }
  validates_attachment_content_type :icon,
    content_type: %w(image/jpeg image/jpg image/png image/gif image/svg+xml)

  belongs_to :person
  belongs_to :theme

  scope :sorted, -> { order("sort_order ASC") }
  scope :by_issue, -> { order("issue_number DESC") }
  # default_scope order "sort_order ASC"

  def icon_attribution_file=(file)
    self.icon_attribution = file.read[/^ {4}(.+?)$/m, 1]
  end

  def set_issue_number
    self.issue_number = self.theme.issue_number
  end
end
