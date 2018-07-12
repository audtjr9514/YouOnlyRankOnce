class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      
      t.integer :sub_number
      t.string :sub_name

      t.timestamps null: false
    end
  end
end
