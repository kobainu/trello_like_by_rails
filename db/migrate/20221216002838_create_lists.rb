class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|

      t.string :title, null: false
      t.references :user, foreign_key: true, null: false # foreign_key: trueは外部キーとして使用するということを示しています。

      t.timestamps
    end
  end
end
