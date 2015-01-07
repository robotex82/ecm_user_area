require 'devise'
require 'devise-i18n'
require 'pundit'
require 'simple_form'

require 'ecm/user_area/engine'
require 'ecm/user_area/configuration'
require 'ecm/user_area/routing'
require 'ecm/user_area/roles'

require 'rbac/role/enumerator'

module Ecm
  module UserArea
    extend Configuration

    def self.roles
      Roles.all
    end
  end
end
