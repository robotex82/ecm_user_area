module Ecm
  module UserArea
    class ConfirmationsController < Devise::ConfirmationsController
      layout Ecm::UserArea::Configuration.layout
    end
  end
end
