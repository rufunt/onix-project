class CreateCooks < ActiveRecord::Migration[6.1]
  def change
    create_table :cooks do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
