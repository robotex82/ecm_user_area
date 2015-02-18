class RolePermission < ActiveRecord::Base
  # Associations
  belongs_to :permission
  belongs_to :role

  # Attributes
  attr_accessible :enabled,
                  :permission_id,
                  :role_id
end
