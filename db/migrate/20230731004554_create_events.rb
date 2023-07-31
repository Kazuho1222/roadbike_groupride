class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.string :meeting_place, null: false
      t.string :return_place, null: false
      t.integer :distance, null: false
      t.integer :climbing, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :capacity, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
