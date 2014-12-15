class CreateMedals < ActiveRecord::Migration
  def change
    create_table :medals do |t|
      t.integer :gold, :default => 0
      t.integer :silver, :default => 0
      t.integer :bronze, :default => 0
      t.integer :user_id

      t.timestamps
    end
  end
end
