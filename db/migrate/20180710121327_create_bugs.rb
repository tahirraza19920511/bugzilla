class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title
      t.date :deadline
      t.string :screenshot
      t.string :types
      t.string :status
      t.references :creator
      t.references :developer
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
