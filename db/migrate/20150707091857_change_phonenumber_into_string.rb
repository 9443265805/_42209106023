class ChangePhonenumberIntoString < ActiveRecord::Migration
  def up
    change_column :users, :phonenumber,  :string
  end

  def down
    change_column :users, :phonenumber,  :integer
  end
end
