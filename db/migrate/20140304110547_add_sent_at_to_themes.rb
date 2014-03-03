class AddSentAtToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :sent_at, :datetime
  end
end
