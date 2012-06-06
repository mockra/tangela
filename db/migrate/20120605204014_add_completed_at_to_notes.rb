class AddCompletedAtToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :completed_at, :datetime
  end
end
