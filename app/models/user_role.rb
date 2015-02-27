class UserRole < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :role

  # Attributes
  if Rails::VERSION::MAJOR < 4
    attr_accessible :user_id,
                    :role_id,
                    :valid_from,
                    :valid_to
  end

  # Callbacks
  after_initialize :set_defaults

  # Delegates
  delegate :name, :description, to: :role, prefix: true

  # Validations
  validates :valid_from, presence: true
  validates :valid_to, presence: true

  def active?
    valid_from < Time.zone.now && valid_to > Time.zone.now
  end

  private

  def set_defaults
    return if persisted?

    self.valid_from = Time.zone.now
    self.valid_to   = Time.zone.parse('9999-12-31 23:59:59')
  end
end
