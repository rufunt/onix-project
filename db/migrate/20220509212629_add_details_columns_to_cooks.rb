class AddDetailsColumnsToCooks < ActiveRecord::Migration[6.1]
  def change
    add_index :cooks, :email, unique: true
    add_index :cooks, :reset_password_token, unique: true
  end
end
