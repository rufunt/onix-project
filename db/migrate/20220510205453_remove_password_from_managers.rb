class RemovePasswordFromManagers < ActiveRecord::Migration[6.1]
  def change
    remove_column :managers, :password, :string
  end
end
