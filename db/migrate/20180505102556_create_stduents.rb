class CreateStduents < ActiveRecord::Migration
  def change
    create_table :stduents do |t|
    
    t.integer :st_number
    t.integer :st_birthday
    t.string :st_name

      t.timestamps null: false
    end
  end
end
