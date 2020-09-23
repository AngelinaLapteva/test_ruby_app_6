class CreateUsersV2 < ActiveRecord::Migration[6.0]
  def change
    create_table :users_v2s do |t|
      t.string :username
      t.string :email
      t.timestamps
    end
  end
end
