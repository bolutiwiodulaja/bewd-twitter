class AddAttributesToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :token, :string
    add_column :tweets, :user_id, :integer
    add_column :tweets, :timestamps, :datetime
    add_index :users, :user_id
  end
end
