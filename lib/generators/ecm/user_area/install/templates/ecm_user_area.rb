Ecm::UserArea.configure do |config|
  # Default : config.devise_modules = [
  #   :confirmable, :database_authenticatable, :lockable, :registerable,
  #   :recoverable, :rememberable, :timeoutable, :trackable, :validatable
  # ]
  config.devise_modules = [
    :confirmable, :database_authenticatable, :lockable, :registerable,
    :recoverable, :rememberable, :timeoutable, :trackable, :validatable
  ]

  # Default: config.disable_registrations = false
  config.disable_registrations = false

  # Default: config.layout = 'application'
  config.layout = 'application'
end
