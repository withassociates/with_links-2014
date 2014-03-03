class RemoveSentFromThemes < ActiveRecord::Migration
  def change
    remove_column :themes, :sent
  end
end
