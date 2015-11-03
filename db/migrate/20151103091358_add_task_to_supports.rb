class AddTaskToSupports < ActiveRecord::Migration
  def change
    add_column :supports, :complete, :boolean
  end
end
