class SendThemeAsEmail
  include Rails.application.routes.url_helpers
  default_url_options[:host] = "links.withassociates.com"

  attr_reader :theme

  def initialize(theme)
    @theme = theme
  end

  def run
    return if theme.sent?
    campaign = CreateSend::Campaign.create(
      auth, client_id, subject, name, from_name, from_email,
      reply_to, html_url, text_url, list_ids, segment_ids
    )
    theme.mark_as_sent!
  end

  private

  def auth
    { api_key: ENV['CREATESEND_API_KEY'] }
  end

  def client_id
    ENV['CREATESEND_CLIENT_ID']
  end

  def subject
    theme.title
  end

  def name
    "#{theme.title} - week #{theme.issue_number}"
  end

  def from_name
    "With Links"
  end

  def from_email
    "withlinks@withassociates.com"
  end

  def reply_to
    "withlinks@withassociates.com"
  end

  def html_url
    theme_url(theme, format: :email)
  end

  def text_url
    nil
  end

  def list_ids
    [ENV['CREATESEND_LIST_ID']]
  end

  def segment_ids
    [ENV['CREATESEND_SEGMENT_ID']]
  end
end
