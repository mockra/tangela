class AddColorToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :color, :string, default: 'default'
  end
end
