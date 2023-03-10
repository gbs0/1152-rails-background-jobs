class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.string :owner
      t.string :plate
      t.string :garage

      t.timestamps
    end
  end
end
