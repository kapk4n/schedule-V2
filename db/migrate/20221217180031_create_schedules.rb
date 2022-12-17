class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.integer :time
      t.integer :day
      t.references :predmet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
