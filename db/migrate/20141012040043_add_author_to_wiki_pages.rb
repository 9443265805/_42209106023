class AddAuthorToWikiPages < ActiveRecord::Migration
  def change
    add_column :wiki_pages, :author, :string
  end
end
