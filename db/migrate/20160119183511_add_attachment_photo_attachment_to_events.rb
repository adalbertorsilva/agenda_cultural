class AddAttachmentPhotoAttachmentToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :photo_attachment
    end
  end

  def self.down
    remove_attachment :events, :photo_attachment
  end
end
