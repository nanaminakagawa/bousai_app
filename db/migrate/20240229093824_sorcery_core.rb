class SorceryCore < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email,            null: false
      t.string :crypted_password
      t.string :salt
      t.string :last_name, null: false #null: falseは空欄入力では名前とは認めないという意味
      t.string :first_name, null: false


      t.timestamps                null: false
    end
    add_index :users, :email, unique: true
  end
end
