class DropClients < ActiveRecord::Migration[6.1]
  def change
    drop_table :clients
  end
end
