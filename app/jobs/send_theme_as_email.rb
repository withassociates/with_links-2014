class SendThemeAsEmail
  include Rails.application.routes.url_helpers
  default_url_options[:host] = "links.withassociates.com"

  attr_reader :theme

  def initialize(theme)
    @theme = theme
  end

  def run
    return if theme.sent?

    theme.mark_as_sent!

    campaign_id = CreateSend::Campaign.create(
      auth, client_id, subject, name, from_name, from_email,
      reply_to, html_url, text_url, list_ids, segment_ids
    )

    campaign = CreateSend::Campaign.new(auth, campaign_id)

    campaign.send(Rails.application.secrets.createsend_confirmation_email)
  rescue
    theme.mark_as_unsent!
  end

  private

  def auth
    { api_key: Rails.application.secrets.createsend_api_key }
  end

  def client_id
    Rails.application.secrets.createsend_client_id
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
    theme_url(theme, format: :email, host: "links.withassociates.com")
  end

  def text_url
    nil
  end

  def list_ids
    [Rails.application.secrets.createsend_list_id]
  end

  def segment_ids
    ids = [Rails.application.secrets.createsend_segment_id].reject(&:blank?)

    if ids.any?
      ids
    else
      nil
    end
  end
end
