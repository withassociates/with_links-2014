class AddFreeTextToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :free_text, :text
  end
end
