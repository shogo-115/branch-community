class CreateUserfavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :userfavorites do |t|
      t.references :admin, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
