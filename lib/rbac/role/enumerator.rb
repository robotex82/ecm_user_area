module Rbac
  module Role
    class Enumerator
      def self.call
        self.new.call
      end

      def call
        Rails::Engine.subclasses.sort { |a, b| a.to_s <=> b.to_s }.collect do |engine|
          namespace = engine.to_s.gsub('::Engine', '').constantize
          namespace.roles if namespace.respond_to?(:roles)
        end.flatten.reject(&:blank?)
      end
    end
  end
end
