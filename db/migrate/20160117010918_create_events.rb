class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :photo
      t.string :place
      t.string :address
      t.date :opening_date
      t.date :ending_date
      t.string :category

      t.timestamps null: false
    end
  end
end
