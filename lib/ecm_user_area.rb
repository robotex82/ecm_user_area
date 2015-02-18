require 'devise'
require 'devise-i18n'
require 'pundit'
require 'simple_form'

require 'ecm/user_area/engine'
require 'ecm/user_area/configuration'
require 'ecm/user_area/routing'
require 'ecm/user_area/roles'
require 'ecm/user_area/permissions'

require 'rbac/role/enumerator'
require 'rbac/permission/enumerator'

module Ecm
  module UserArea
    extend Configuration

    def self.roles
      Roles.all
    end

    def self.permissions
      Permissions.all
    end
  end
end
