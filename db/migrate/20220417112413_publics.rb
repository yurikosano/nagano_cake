class Publics < ActiveRecord::Migration[6.1]
  def change
    drop_table :customers
  end
end
