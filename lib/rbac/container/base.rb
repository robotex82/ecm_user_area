module Rbac
  module Container
    class Base
      def self.all
        self.constants.select { |c| self.const_get(c).is_a? Class }.collect{ |klass| "#{self}::#{klass}"}.map(&:constantize).map(&:new)
      end
    end
  end
end
