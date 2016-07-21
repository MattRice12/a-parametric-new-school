class RemoveSchoolIdFromSchools < ActiveRecord::Migration[5.0]
  def change
    remove_column :schools, :school_id, :integer
  end
end
