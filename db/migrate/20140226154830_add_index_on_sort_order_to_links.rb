class AddIndexOnSortOrderToLinks < ActiveRecord::Migration
  def change
    add_index :links, :sort_order
  end
end
