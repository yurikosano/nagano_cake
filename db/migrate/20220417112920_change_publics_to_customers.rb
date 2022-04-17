class ChangePublicsToCustomers < ActiveRecord::Migration[6.1]
  def change
    rename_table :publics, :customers
  end
end
