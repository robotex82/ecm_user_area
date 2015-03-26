require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/hash_with_indifferent_access'

module Ecm
  module UserArea
    module Configuration
      def configure
        yield self
      end

      mattr_accessor :devise_modules do
        [
          :confirmable, :database_authenticatable, :lockable, :registerable,
          :recoverable, :rememberable, :timeoutable, :trackable, :validatable
        ]
      end

      mattr_accessor :disable_registrations do
        false
      end

      mattr_accessor :layout do
        'application'
      end

      def self.registrations_disabled?
        disable_registrations
      end
    end
  end
end
