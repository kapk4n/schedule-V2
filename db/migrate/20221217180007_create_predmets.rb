class CreatePredmets < ActiveRecord::Migration[7.0]
  def change
    create_table :predmets do |t|
      t.string :name
      t.references :teach, null: false, foreign_key: true

      t.timestamps
    end
  end
end
