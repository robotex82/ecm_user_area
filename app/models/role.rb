class Role < ActiveRecord::Base
  # Associations
  has_many :user_roles
  has_many :users, :through => :user_roles

  has_many :role_permissions
  has_many :enabled_role_permissions, :class_name => "RolePermission",
                                      :conditions => [ 'role_permissions.enabled = ?', true ]
  has_many :permissions, :through => :role_permissions
  has_many :enabled_permissions, :through => :enabled_role_permissions,
                                 :class_name => "Permission",
                                 :source => :permission,
                                 :conditions => [ 'permissions.enabled = ?', true ]

  # Attributes
  attr_accessible :description,
                  :enabled,
                  :identifier,
                  :namespace

  # Validations
  validates :namespace, :presence => true
  validates :identifier, :presence => true

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
    "#{namespace}/roles/#{identifier}".underscore.gsub("/", ".")
  end
end
