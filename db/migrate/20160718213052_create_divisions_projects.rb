class CreateDivisionsProjects < ActiveRecord::Migration
  def change
    create_table(:divisions_projects) do |t|
      t.belongs_to :division, index: true
      t.belongs_to :employee, index: true
    end
  end
end
