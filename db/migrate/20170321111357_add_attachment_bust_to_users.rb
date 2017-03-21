class AddAttachmentBustToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :bust
    end
  end

  def self.down
    remove_attachment :users, :bust
  end
end
