class AddForeignKeyOfKillAndEmployeeInEmployeesSkills < ActiveRecord::Migration[5.2]
  def change
  	add_reference :employees_skills,:skill,foreign_key:true
  	add_reference :employees_skills,:employee,foreign_key:true
  end
end
