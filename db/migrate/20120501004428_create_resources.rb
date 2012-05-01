class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :type
      t.string :value
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
    add_index :resources, :user_id
    add_index :resources, :project_id
  end
end
