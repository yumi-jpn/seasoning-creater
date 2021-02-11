class CreateTastes < ActiveRecord::Migration[6.0]
  def change
    create_table :tastes do |t|
      t.string :title,                null: false
      t.text :example,                null: false
      t.integer :genre_id,            null: false
      t.references :user,             foreign_key: true, null: false
      t.timestamps
    end
  end
end