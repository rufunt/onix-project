class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :amount
      t.boolean :completed

      t.timestamps
    end
  end
end
