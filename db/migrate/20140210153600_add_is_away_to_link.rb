class AddIsAwayToLink < ActiveRecord::Migration
  def change
    add_column :links, :is_away, :boolean, :default => false
  end
end
