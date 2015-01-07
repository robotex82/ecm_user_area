require 'rbac/role/base'

module Ecm
  module UserArea
    module Roles
      class UserAdmin < Rbac::Role::Base
      end

      class SuperAdmin < Rbac::Role::Base
      end

      def self.all
        self.constants.select { |c| self.const_get(c).is_a? Class }.collect{ |klass| "#{self}::#{klass}"}.map(&:constantize).map(&:new)
      end
    end
  end
end
