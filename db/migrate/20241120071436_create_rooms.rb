class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms, id:false do |t|
      t.primary_key :uuid, :string
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end