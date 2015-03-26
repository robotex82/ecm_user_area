class User < ActiveRecord::Base
  # Associations
  has_many :user_roles
  has_many :roles, through: :user_roles
  if Rails::VERSION::MAJOR < 4
    has_many :active_roles, through: :user_roles,
                            class_name: 'Role',
                            source: :role,
                            conditions: ['user_roles.valid_from < ? AND user_roles.valid_to > ? AND roles.enabled = ?',
                                         Time.zone.now, Time.zone.now, true]
  else
    has_many :active_roles,
             (lambda do |_|
               where('user_roles.valid_from < ? AND user_roles.valid_to > ? AND roles.enabled = ?',
                     Time.zone.now,
                     Time.zone.now,
                     true
               )
             end),
             through: :user_roles,
             class_name: 'Role',
             source: :role
  end
  has_many :permissions, through: :roles
  has_many :enabled_permissions, through: :active_roles,
                                 class_name: 'Permission',
                                 source: :enabled_permissions

  # Include default devise modules. Others available are:
  # :token_authenticatable and :omniauthable
  devise(*Ecm::UserArea::Configuration.devise_modules) if User.respond_to?(:devise)

  # Setup accessible (or protected) attributes for your model
  if Rails::VERSION::MAJOR < 4
    attr_accessible :email,
                    :password,
                    :password_confirmation,
                    :remember_me
  end

  def devise_mailer
    Ecm::UserArea::Mailer
  end

  def permission?(permission_identifier)
    enabled_permissions.map(&:qualified_identifier).include?(permission_identifier.to_s)
  end

  def role?(role_identifier)
    active_roles.map(&:qualified_identifier).include?(role_identifier.to_s)
  end

  def to_s
    email
  end
end
