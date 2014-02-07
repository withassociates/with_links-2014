class AddPublishedToTheme < ActiveRecord::Migration
  def change
    add_column :themes, :published, :boolean
  end
end
