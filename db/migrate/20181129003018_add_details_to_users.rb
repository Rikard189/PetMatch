class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstname,          :string
    add_column :users, :lastname,           :string
    add_column :users, :profile_pic,    :string
    add_column :users, :state,            :string
    add_column :users, :city,           :string
    add_column :users, :municipality, :string
    add_column :users, :age, :integer
  end
end
