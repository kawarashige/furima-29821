class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :last_name,           null: false, default: ""
      t.string :last_name_kana,      null: false, default: ""
      t.string :first_name,          null: false, default: ""
      t.string :first_name_kana,     null: false, default: ""
      t.string :nickname,            null: false, default: ""
      t.date   :birth_day,           null: false
      t.timestamps
    end
  end
end
