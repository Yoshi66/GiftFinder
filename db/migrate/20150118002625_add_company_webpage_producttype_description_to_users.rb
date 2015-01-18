class AddCompanyWebpageProducttypeDescriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_type, :string
    add_column :users, :webpage, :string
    add_column :users, :product_type, :string
    add_column :users, :description, :text
  end
end
