class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.text :name
      t.text :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
