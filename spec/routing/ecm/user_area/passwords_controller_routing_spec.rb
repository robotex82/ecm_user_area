require 'spec_helper'

module Ecm
  module UserArea
    describe PasswordsController do
      it 'routes to #new' do
        get('/en/users/password/new').should route_to('ecm/user_area/passwords#new', i18n_locale: 'en')
      end # it
    end # describe PasswordsController
  end # module UserArea
end # module Ecm
