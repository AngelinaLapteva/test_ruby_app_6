class AddTimestampsToArticlesV2 < ActiveRecord::Migration[6.0]
  def change
    # add_coumnt is a method to an existing table, then name of table (articles_v2s)
    # then column name "created_at"
    # 3rd argument will be data type
    add_column :articles_v2s, :created_at, :datetime
    add_column :articles_v2s, :updated_at, :datetime
  end
end
