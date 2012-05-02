class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :content

      t.timestamps
    end
    add_index :notes, :user_id
    add_index :notes, :project_id
  end
end
