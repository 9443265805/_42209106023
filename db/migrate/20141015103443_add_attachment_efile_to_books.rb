class AddAttachmentEfileToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :efile
    end
  end

  def self.down
    remove_attachment :books, :efile
  end
end
