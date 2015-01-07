class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.references :role,      :null => false
      t.references :user,      :null => false
      t.timestamp :valid_from, :null => false
      t.timestamp :valid_to,   :null => false

      t.timestamps
    end
    add_index :user_roles, :role_id
    add_index :user_roles, :user_id
  end
end
