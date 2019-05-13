class JoinTableForUserAndDepartment < ActiveRecord::Migration[5.2]
  def change
  	create_join_table :users, :departments, column_options: { null: true}
  end
end
