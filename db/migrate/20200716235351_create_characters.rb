class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.references :user, null: false, foreign_key: true
      t.references :story, null: false, foreign_key: true
      t.string :name
      t.integer :age
      t.string :gender
      t.string :species
      t.string :overview
      t.string :personality

      t.timestamps
    end
  end
end
