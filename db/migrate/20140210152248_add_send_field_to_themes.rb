class AddSendFieldToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :sent, :boolean
  end
end
