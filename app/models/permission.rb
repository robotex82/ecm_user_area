class Permission < ActiveRecord::Base
  # Associations
  has_many :role_permissions
  has_many :roles, through: :role_permissions

  # Attributes
  if Rails::VERSION::MAJOR < 4
    attr_accessible :description,
                    :enabled,
                    :identifier,
                    :namespace
  end

  # Validations
  validates :namespace, presence: true
  validates :identifier, presence: true

  def qualified_identifier
    "#{namespace}/#{identifier}"
  end

  def to_s
    qualified_identifier
  end

  def name
    I18n.t("#{i18n_namespace}.name")
  end

  def description
    I18n.t("#{i18n_namespace}.description")
  end

  private

  def i18n_namespace
    "#{namespace}/permissions/#{identifier}".underscore.gsub('/', '.')
  end
end
