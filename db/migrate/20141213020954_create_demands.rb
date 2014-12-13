class CreateDemands < ActiveRecord::Migration
  def change
    create_table :demands do |t|
      t.string :country
      t.string :gender
      t.integer :age
      t.integer :price
      t.string :purpose
      t.string :category
      t.text :describe
      t.text :other
      t.integer :user_id

      t.timestamps
    end
  end
end
