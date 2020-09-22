class AddUserIdToArticlesV2s < ActiveRecord::Migration[6.0]
  def change
    add_column :articles_v2s, :user_id, :int
  end
end
