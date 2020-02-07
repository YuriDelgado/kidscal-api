class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.date :birth
      t.integer :gender
      t.text :description

      t.timestamps
    end
  end
end
