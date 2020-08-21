class CreateSalonfavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :salonfavorites do |t|
      t.references :user, null: false
      t.references :admin, null: false

      t.timestamps
    end
  end
end
