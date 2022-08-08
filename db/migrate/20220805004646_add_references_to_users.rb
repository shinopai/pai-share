class AddReferencesToUsers < ActiveRecord::Migration[7.0]
  def change
     add_reference :users, :age, null: false, foreign_key: true
     add_reference :users, :gender, null: false, foreign_key: true
     add_reference :users, :residence, null: false, foreign_key: true
  end
end
