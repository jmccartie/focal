class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :all_pages

  def all_pages
    Page.order(:sort_order)
  end
end
