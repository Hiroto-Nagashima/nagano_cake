class ChangeIsActiveOfCustomers < ActiveRecord::Migration[5.2]
  def up
    change_column :customers, :is_active, :string, default:"有効"
  end

  def down
    change_column :customers, :is_active, :string
  end
end
