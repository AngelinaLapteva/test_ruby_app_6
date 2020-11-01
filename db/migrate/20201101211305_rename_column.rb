class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :article_categories, :article_id, :articles_v2s_id
  end
end
