class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.string :frame_1
      t.string :frame_2
      t.string :frame_3
      t.string :frame_4
      t.string :frame_5
      t.string :frame_6
      t.string :frame_7
      t.string :frame_8
      t.string :frame_9
      t.string :frame_10
      t.integer :total

      t.timestamps
    end
  end
end
