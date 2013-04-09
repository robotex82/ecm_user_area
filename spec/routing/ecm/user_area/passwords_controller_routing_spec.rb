require 'spec_helper'

module Ecm::UserArea
  describe PasswordsController do
    it 'routes to #new' do
      get('/en/users/password/new').should route_to('ecm/user_area/passwords#new', :i18n_locale => 'en')
    end # it
  end # describe PasswordsController
end # module Ecm::UserArea

