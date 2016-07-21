class RemoveUserFromSchools < ActiveRecord::Migration[5.0]
  def change
    remove_column :schools, :user, :string
  end
end
