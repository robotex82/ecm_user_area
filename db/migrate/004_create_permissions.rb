class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :namespace
      t.string :identifier
      t.boolean :enabled
      t.text :description

      t.timestamps
    end
  end
end
