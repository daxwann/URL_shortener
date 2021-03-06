class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email,
        null: false,
        unique: true,
        index: true

      t.timestamps
    end
  end
end
