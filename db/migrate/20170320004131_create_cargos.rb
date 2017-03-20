class CreateCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.string :title
      t.references :port, index: true, foreign_key: true
      t.date :open_date
      t.integer :capacity

      t.timestamps null: false
    end
  end
end
