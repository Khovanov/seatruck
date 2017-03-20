class CreatePorts < ActiveRecord::Migration
  def change
    create_table :ports do |t|
      t.string :title
      t.decimal :lat, precision: 13, scale: 10
      t.decimal :lng, precision: 13, scale: 10

      t.timestamps null: false
    end
  end
end
