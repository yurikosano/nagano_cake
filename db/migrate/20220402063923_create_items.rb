class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.timestamps
      t.integer :genre_id
      t.string :name
      t.text :introduction
      t.integer :price
      t.boolean :is_active
    end
  end
end
