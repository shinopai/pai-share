class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :image, null: false
      t.date :release_date, null: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
