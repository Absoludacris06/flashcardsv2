class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, :uniquness => true #fix this, typo
      t.string :password_hash

      t.timestamp
    end
  end
end
