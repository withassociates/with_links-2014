class ApplicationController < ActionController::Base
  before_filter :redirect_if_old_url
  protect_from_forgery with: :exception


  protected

  def redirect_if_old_url
    if request.host == 'withlinks.com' || request.host == 'www.withlinks.com'
      redirect_to "http://links.withassociates.com#{request.fullpath}", status: :moved_permanently
    end
  end
end
