class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.text :caption
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
