class AddAttachmentIconToLinks < ActiveRecord::Migration
  def self.up
    change_table :links do |t|
      t.attachment :icon
    end
  end

  def self.down
    drop_attached_file :links, :icon
  end
end
