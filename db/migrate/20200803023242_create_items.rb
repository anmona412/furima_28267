class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer     :user_id, null: false
      t.string      :name, null: false
      t.text        :comment, null: false
      t.integer     :category_id, null:false
      t.integer     :price, null:false
      t.integer     :status_id, null:false
      t.integer     :burden_id, null:false
      t.integer     :prefecture_id, null:false
      t.integer     :send_at_id, null:false
      t.timestamps
    end
  end
end
