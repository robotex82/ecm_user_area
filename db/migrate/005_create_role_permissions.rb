class CreateRolePermissions < ActiveRecord::Migration
  def change
    create_table :role_permissions do |t|
      t.references :role,       :null => false
      t.references :permission, :null => false
      t.boolean    :enabled,    :null => false

      t.timestamps
    end
    add_index :role_permissions, :role_id
    add_index :role_permissions, :permission_id
  end
end
