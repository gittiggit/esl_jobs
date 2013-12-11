class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :countryname , default:"bangladesh"

      t.timestamps
    end
  end
end
