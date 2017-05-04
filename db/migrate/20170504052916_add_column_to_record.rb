class AddColumnToRecord < ActiveRecord::Migration[5.1]
  def change
    add_column :records, :thumbnail, :binary
  end
end
