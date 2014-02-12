class AddDefaultToSent < ActiveRecord::Migration
  def up
    change_column :themes, :sent, :boolean, :default => false
  end

  def down
    change_column :theme, :sent, :boolean, :default => nil
  end
end
