class CreateImageLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :image_likes do |t|
      t.integer :user_id
      t.integer :image_id

      t.timestamps
    end
  end
end
