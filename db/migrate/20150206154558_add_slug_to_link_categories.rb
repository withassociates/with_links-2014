class AddSlugToLinkCategories < ActiveRecord::Migration
  def change
    add_column :link_categories, :slug, :string
    add_index :link_categories, :slug, unique: true
  end
end
