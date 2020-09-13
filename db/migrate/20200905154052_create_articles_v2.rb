
# class should be named sasme as your table with wich it works but instead of _ will be capitalized
class CreateArticlesV2 < ActiveRecord::Migration[6.0]
  def change
    create_table :articles_v2s do |t|
      t.string :title
      t.text :description
    end
  end
end
