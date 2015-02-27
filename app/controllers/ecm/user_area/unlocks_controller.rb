module Ecm
  module UserArea
    class UnlocksController < Devise::UnlocksController
      layout Ecm::UserArea::Configuration.layout
    end
  end
end
