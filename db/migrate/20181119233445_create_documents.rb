class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :file
      t.string :title
      t.text :description
      t.references :pet, foreign_key: true
      t.timestamps
    end
  end
end
