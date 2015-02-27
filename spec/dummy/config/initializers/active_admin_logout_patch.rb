module ActiveAdmin
  module Devise
    class SessionsController
      def after_sign_out_path_for(_resource_or_scope)
        "/#{I18n.locale}"
      end
    end
  end
end
