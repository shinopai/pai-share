class CreateGenders < ActiveRecord::Migration[7.0]
  def change
    create_table :genders do |t|
      t.string :title, null: false, default: ""
      t.timestamps
    end
  end
end
