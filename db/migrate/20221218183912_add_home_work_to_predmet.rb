class AddHomeWorkToPredmet < ActiveRecord::Migration[7.0]
  def change
    add_column :predmets, :homework, :string
  end
end
