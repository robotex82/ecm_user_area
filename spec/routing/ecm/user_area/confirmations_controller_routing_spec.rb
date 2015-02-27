require 'spec_helper'

module Ecm
  module UserArea
    describe ConfirmationsController do
      it 'routes to #sign_in' do
        get('/en/users/confirmation/new').should route_to('ecm/user_area/confirmations#new', i18n_locale: 'en')
      end # it
    end # describe ConfirmationsController
  end # module UserArea
end # module Ecm
