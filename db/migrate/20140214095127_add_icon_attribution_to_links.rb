class AddIconAttributionToLinks < ActiveRecord::Migration
  def change
    add_column :links, :icon_attribution, :string
  end
end
