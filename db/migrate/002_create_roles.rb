class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :namespace
      t.string :identifier
      t.boolean :enabled
      t.text :description

      t.timestamps
    end
  end
end
