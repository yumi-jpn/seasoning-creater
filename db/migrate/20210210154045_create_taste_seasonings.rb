class CreateTasteSeasonings < ActiveRecord::Migration[6.0]
  def change
    create_table :taste_seasonings do |t|
      t.references :taste,             foreign_key: true, ull: false
      t.string :seasoning_name,        null: false
      t.string :quantity,              null: false
      t.timestamps
    end
  end
end