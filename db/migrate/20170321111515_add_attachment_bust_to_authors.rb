class AddAttachmentBustToAuthors < ActiveRecord::Migration
  def self.up
    change_table :authors do |t|
      t.attachment :bust
    end
  end

  def self.down
    remove_attachment :authors, :bust
  end
end
