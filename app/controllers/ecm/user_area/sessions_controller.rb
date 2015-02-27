module Ecm
  module UserArea
    class SessionsController < Devise::SessionsController
      layout Ecm::UserArea::Configuration.layout
    end
  end
end
