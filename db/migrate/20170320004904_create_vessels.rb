class CreateVessels < ActiveRecord::Migration
  def change
    create_table :vessels do |t|
      t.string :title
      t.integer :hold_capacity

      t.timestamps null: false
    end
  end
end
