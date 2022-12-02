class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :message
      t.string :user_id
      t.datetime :timestamps

      t.timestamps
    end
  end
end
