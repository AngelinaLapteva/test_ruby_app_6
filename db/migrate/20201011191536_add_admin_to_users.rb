class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    # action :tablename, column, datatype, default initial value
    add_column :users, :admin, :boolean, default: false
  end
end
