class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.text :body
      t.integer :rating
      t.references :product, foreign_key: true
<<<<<<< HEAD
=======

>>>>>>> 7e382774853971226f5fb3501a3cd92bf87d0bbd
      t.timestamps
    end
  end
end
