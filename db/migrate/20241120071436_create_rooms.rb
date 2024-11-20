class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :uuid
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
