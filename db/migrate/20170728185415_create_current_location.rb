class CreateCurrentLocation < ActiveRecord::Migration[5.1]
  def change
    create_table :current_locations do |t|
      t.float :latitude
      t.float :longitude
    end
  end
end
