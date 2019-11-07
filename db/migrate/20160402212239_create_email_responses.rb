class CreateEmailResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :email_responses do |t|
      t.string :email
      t.text :extra_info
      t.integer :response_type

      t.timestamps null: false
    end
  end
end
