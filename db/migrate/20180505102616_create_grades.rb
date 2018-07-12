class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|

      t.integer :st_number
      t.integer :st_birthday
      t.integer :sub_number
      t.integer :mid_score
      t.integer :final_score
      t.integer :hw
      t.integer :attend
      t.float :total
      
      t.references :student, index:true, foreign_key: true
      t.references :subject, index:true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
