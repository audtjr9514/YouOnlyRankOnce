class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      
      t.integer :prof_num
      t.string :prof_name

      t.timestamps null: false
    end
  end
end
