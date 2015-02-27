require 'spec_helper'

module Ecm
  module UserArea
    describe SessionsController do
      it 'routes to #sign_in' do
        get('/en/users/sign_in').should route_to('ecm/user_area/sessions#new', i18n_locale: 'en')
      end # it
    end # describe SessionsController
  end # module UserArea
end # module Ecm
