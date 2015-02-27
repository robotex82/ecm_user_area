module Ecm
  module UserArea
    class PasswordsController < Devise::PasswordsController
      layout Ecm::UserArea::Configuration.layout
    end
  end
end
