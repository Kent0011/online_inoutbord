class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :room_key, null: false
      t.string :name
      t.boolean :status, null: false, default: false

      t.timestamps
    end
  end
end

