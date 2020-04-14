class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.bigint :seller_id, null: false, foreign_key: true
      t.bigint :buyer_id, null: false, foreign_key: true
      t.belongs_to :item, null: false, foreign_key: true
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
