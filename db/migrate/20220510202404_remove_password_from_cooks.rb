class RemovePasswordFromCooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :cooks, :password, :string
  end
end
