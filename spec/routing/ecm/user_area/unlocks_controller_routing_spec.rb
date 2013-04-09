require 'spec_helper'

module Ecm::UserArea
  describe UnlocksController do
    it 'routes to #sign_in' do
      get('/en/users/unlock/new').should route_to('ecm/user_area/unlocks#new', :i18n_locale => 'en')
    end # it
  end # describe UnlocksController
end # module Ecm::UserArea

