class AddAttachmentPreviewToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :preview
    end
  end

  def self.down
    remove_attachment :books, :preview
  end
end
