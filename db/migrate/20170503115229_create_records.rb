class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.text :description
      t.float :latitude
      t.float :longitude
      t.date :start_date
      t.date :end_date
      t.text :url

      t.timestamps
    end
    add_index :records, :title
  end
end
