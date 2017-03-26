class AddRecorableAttributesToRecordings < ActiveRecord::Migration
  def change
    add_column :recordings, :recordable_id, :integer
    add_column :recordings, :recordable_type, :string
  end
end
