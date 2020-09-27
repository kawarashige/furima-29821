class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true, default: ""
      t.references :item, null: false, foreign_key: true, default: ""
      t.timestamps
    end
  end
end
