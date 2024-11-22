class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.references :room, null: false, foreign_key: true
      t.string :name
      t.boolean :status, null: false, default: false

      t.timestamps
    end
  end
end

