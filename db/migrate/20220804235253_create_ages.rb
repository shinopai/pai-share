class CreateAges < ActiveRecord::Migration[7.0]
  def change
    create_table :ages do |t|
      t.string :title, null: false, default: ""
      t.timestamps
    end
  end
end
