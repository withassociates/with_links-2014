class ApplicationController < ActionController::Base
  before_filter :redirect_if_old_url
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def redirect_if_old_url
    if request.host == 'withlinks.com'
      redirect_to "http://links.withassociates.com#{request.request_uri}", status: :moved_permanently
    end
  end
end
