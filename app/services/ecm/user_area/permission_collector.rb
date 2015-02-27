module Ecm
  module UserArea
    class PermissionCollector
      def self.call
        new.call
      end

      def call
        permissions = Rbac::Permission::Enumerator.call
        permissions.each do |permission|
          Permission.where(namespace: permission.namespace, identifier: permission.identifier).first_or_create
        end
      end
    end
  end
end
