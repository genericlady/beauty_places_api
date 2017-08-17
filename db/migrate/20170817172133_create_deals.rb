class CreateDeals < ActiveRecord::Migration[5.1]
  def change
    create_table :deals do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 15, scale: 2

      t.timestamps
    end
  end
end
