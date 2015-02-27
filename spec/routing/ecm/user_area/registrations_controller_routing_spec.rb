require 'spec_helper'

module Ecm
  module UserArea
    describe RegistrationsController do
      it 'routes to #sign_up' do
        get('/en/users/sign_up').should route_to('ecm/user_area/registrations#new', i18n_locale: 'en')
      end # it
    end # describe RegistrationsController
  end # module UserArea
end # module Ecm
