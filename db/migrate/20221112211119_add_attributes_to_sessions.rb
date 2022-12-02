class AddAttributesToSessions < ActiveRecord::Migration[6.1]
  def change
    add_column :sessions, :token, :string
    add_column :sessions, :user_id, :integer
    add_column :sessions, :timestamps, :datetime
    add_index :users, :user_id
  end
end
