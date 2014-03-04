class AddReadyToSendToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :ready_to_send, :boolean
  end
end
