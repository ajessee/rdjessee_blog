class AddRecorableAttributesToRecordings < ActiveRecord::Migration[5.2]
  def change
    add_column :recordings, :recordable_id, :integer
    add_column :recordings, :recordable_type, :string
  end
end
