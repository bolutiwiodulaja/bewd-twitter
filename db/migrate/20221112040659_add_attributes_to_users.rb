class AddAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :email, :string
    add_column :users, :password, :string
    add_column :users, :timestamps, :datetime
    add_index :users, :username
    add_index :users, :email
  end
end
