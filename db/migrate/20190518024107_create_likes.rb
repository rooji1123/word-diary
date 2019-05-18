class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|

      t.timestamps
      t.integer :user_id
      t.integer :story_id
    end
  end
end
