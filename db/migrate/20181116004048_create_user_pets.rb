class CreateUserPets < ActiveRecord::Migration[5.2]
  def change
    create_table :user_pets do |t|
      t.references :user, foreign_key: true
      t.references :pet, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
