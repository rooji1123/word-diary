class RenameStoryIdColumnToLikes < ActiveRecord::Migration[5.0]
  def change
    rename_column :likes, :story_id, :tweet_id
  end
end
