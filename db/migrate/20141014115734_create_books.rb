class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :bookname
      t.string :author
      t.string :category
      t.string :type
      t.integer :price
      t.date :lenddate
      t.date :duedate
      t.integer :renewcount
      t.string :status
      t.belongs_to :user
      t.timestamps
    end
  end
end
