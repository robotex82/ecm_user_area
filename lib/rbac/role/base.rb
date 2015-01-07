module Rbac
  module Role
    class Base
      def namespace
        self.class.to_s.deconstantize.underscore.gsub("/roles", "")
      end

      def identifier
        self.class.to_s.demodulize.underscore
      end

      def name
        I18n.t("#{i18n_namespace}.name")
      end

      def description
        I18n.t("#{i18n_namespace}.description")
      end

      private

      def i18n_namespace
        self.class.to_s.underscore.gsub("/", ".")
      end
    end
  end
end
