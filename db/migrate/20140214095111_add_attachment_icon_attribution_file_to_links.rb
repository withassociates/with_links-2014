class AddAttachmentIconAttributionFileToLinks < ActiveRecord::Migration
  def self.up
    change_table :links do |t|
      t.attachment :icon_attribution_file
    end
  end

  def self.down
    drop_attached_file :links, :icon_attribution_file
  end
end
