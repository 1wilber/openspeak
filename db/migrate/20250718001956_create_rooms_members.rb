class CreateRoomsMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms_members do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :rooms_members, [ :room_id, :user_id ], unique: true
  end
end
