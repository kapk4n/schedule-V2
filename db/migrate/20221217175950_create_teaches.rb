class CreateTeaches < ActiveRecord::Migration[7.0]
  def change
    create_table :teaches do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
