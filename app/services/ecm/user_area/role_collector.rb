module Ecm
  module UserArea
    class RoleCollector
      def self.call
        new.call
      end

      def call
        roles = Rbac::Role::Enumerator.call
        roles.each do |role|
          Role.where(namespace: role.namespace, identifier: role.identifier).first_or_create
        end
      end
    end
  end
end
