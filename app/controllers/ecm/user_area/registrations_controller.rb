module Ecm
  module UserArea
    class RegistrationsController < Devise::RegistrationsController
      layout Ecm::UserArea::Configuration.layout

      def new
        if Ecm::UserArea::Configuration.registrations_disabled?
          handle_disabled_registration
        else
          super
        end
      end

      def create
        if Ecm::UserArea::Configuration.registrations_disabled?
          handle_disabled_registration
        else
          super
        end
      end

      private

      def handle_disabled_registration
        redirect_to root_path, notice: t('ecm.user_area.messages.notices.registrations_disabled')
      end
    end
  end
end
