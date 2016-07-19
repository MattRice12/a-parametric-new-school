class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.belongs_to :school, foreign_key: true
      t.belongs_to :teacher, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
