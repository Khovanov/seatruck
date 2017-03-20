class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :vessel, index: true, foreign_key: true
      t.references :port, index: true, foreign_key: true
      t.date :open_date

      t.timestamps null: false
    end
  end
end
