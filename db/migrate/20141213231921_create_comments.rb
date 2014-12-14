class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :post
      t.string :url
      t.string :question
      t.integer :demand_id
      t.integer :user_id

      t.timestamps
    end
  end
end
