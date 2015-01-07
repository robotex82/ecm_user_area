class User < ActiveRecord::Base
  # Associations
  has_many :user_roles
  has_many :roles, :through => :user_roles
  has_many :active_roles, :through => :user_roles,
           :class_name => "Role",
           :source => :role,
           :conditions => [ 'user_roles.valid_from < ? AND user_roles.valid_to > ? AND roles.enabled = ?', Time.zone.now, Time.zone.now, true ]

  # Include default devise modules. Others available are:
  # :token_authenticatable and :omniauthable
  devise :confirmable, :database_authenticatable, :lockable, :registerable,
         :recoverable, :rememberable, :timeoutable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :remember_me

  def devise_mailer
    Ecm::UserArea::Mailer
  end

  def has_role?(role_identifier)
    active_roles.map(&:qualified_identifier).include?(role_identifier.to_s)
  end

  def to_s
    email
  end
end
