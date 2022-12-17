class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :spisok
      t.references :stud, null: false, foreign_key: true
      t.references :predmet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
