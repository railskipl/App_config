class CreateProjectSettings < ActiveRecord::Migration
  def change
    create_table :project_settings do |t|
      t.string :project_name
      t.boolean :access, :default => false

      t.timestamps null: false
    end
  end
end
