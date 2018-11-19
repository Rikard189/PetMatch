class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.text :description
      t.integer :animal_type
      t.string :breed

      t.timestamps
    end
  end
end
