class AddGuestsToPeople < ActiveRecord::Migration
  def change
    add_column :people, :is_guest, :boolean
  end
end
