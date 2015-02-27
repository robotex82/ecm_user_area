class Role < ActiveRecord::Base
  # Associations
  has_many :user_roles
  has_many :users, through: :user_roles

  has_many :role_permissions
  has_many :permissions, through: :role_permissions
  if Rails::VERSION::MAJOR < 4
    has_many :enabled_role_permissions, class_name: 'RolePermission',
                                        conditions: ['role_permissions.enabled = ?', true]
    has_many :enabled_permissions, through: :enabled_role_permissions,
                                   class_name: 'Permission',
                                   source: :permission,
                                   conditions: ['permissions.enabled = ?', true]
  else
    has_many :enabled_role_permissions,
             ->(_object) { where('role_permissions.enabled = ?', true) },
             class_name: 'RolePermission'
    has_many :enabled_permissions,
             ->(_object) { where('permissions.enabled = ?', true) },
             through: :enabled_role_permissions,
             class_name: 'Permission',
             source: :permission
  end

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
    "#{namespace}/roles/#{identifier}".underscore.gsub('/', '.')
  end
end
