module Rbac
  module Permission
    class Enumerator
      def self.call
        new.call
      end

      def call
        Rails::Engine.subclasses.sort { |a, b| a.to_s <=> b.to_s }.collect do |engine|
          namespace = engine.to_s.gsub('::Engine', '').constantize
          namespace.permissions if namespace.respond_to?(:permissions)
        end.flatten.reject(&:blank?)
      end
    end
  end
end
