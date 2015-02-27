module Ecm
  module UserArea
    class Engine < ::Rails::Engine
      initializer :ecm_user_area_engine do
        ActiveAdmin.setup do |config|
          config.load_paths << File.join(root, 'app/admin')
        end
      end if Object.const_defined?('ActiveAdmin')

      config.to_prepare do
        Ecm::UserArea::ApplicationController.helper(Dzb::Core::ApplicationHelper)
        Ecm::UserArea::ApplicationController.helper(Dzb::Core::BootstrapHelper)
        Ecm::UserArea::ApplicationController.helper(Dzb::Core::FrontendHelper)
        Ecm::UserArea::ApplicationController.helper(Dzb::Core::I18nHelper)
      end
    end
  end
end
