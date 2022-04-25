class CreateCashDesks < ActiveRecord::Migration[6.1]
  def change
    create_table :cash_desks do |t|
      t.decimal :all_balance
      t.decimal :cook_balance

      t.timestamps
    end
  end
end
