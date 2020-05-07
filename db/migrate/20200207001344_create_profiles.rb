class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :last_name
      t.string :aka_name
      t.string :gender
      t.string :cellphone
      t.date :birthday
      t.text :description

      t.timestamps
    end
  end
end
