class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|

      t.timestamps
      t.string :body, null: false
      t.integer :user_id, null: false
    end
  end
end
