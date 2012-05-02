class ChangeTypeToFormatOnResources < ActiveRecord::Migration
  def change
    rename_column :resources, :type, :format
  end
end
