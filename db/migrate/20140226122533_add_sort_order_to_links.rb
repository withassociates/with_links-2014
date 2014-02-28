class AddSortOrderToLinks < ActiveRecord::Migration
  def change
    add_column :links, :sort_order, :integer
  end
end
