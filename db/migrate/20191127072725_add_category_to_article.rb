class AddCategoryToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :category, :integer, null: false, limit: 1
  end
end
