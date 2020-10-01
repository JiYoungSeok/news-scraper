class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.integer :platform
      t.integer :category

      t.timestamps

      t.index :platform
      t.index :category
    end
  end
end
