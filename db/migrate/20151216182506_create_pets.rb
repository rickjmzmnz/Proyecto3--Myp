class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :kind
      t.string :name
      t.string :age
      t.text :description
      t.string :vaccinated
      t.string :sterilized
      t.string :location

      t.timestamps null: false
    end
  end
end
