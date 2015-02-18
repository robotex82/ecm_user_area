require 'rbac/role/base'
require 'rbac/role/container/base'

module Ecm
  module UserArea
    class Roles < Rbac::Role::Container::Base
      class UserAdmin < Rbac::Role::Base
      end

      class SuperAdmin < Rbac::Role::Base
      end
    end
  end
end
