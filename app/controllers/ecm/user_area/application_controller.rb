module Ecm
  module UserArea
    class ApplicationController < ActionController::Base
      # Prevent CSRF attacks by raising an exception.
      # For APIs, you may want to use :null_session instead.
      protect_from_forgery with: :exception

      include RailsTools::I18nController
    end
  end
end
