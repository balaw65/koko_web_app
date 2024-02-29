class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :timezone
      t.string :lessontime
      t.string :lessonday
      t.string :usertype

      t.timestamps
    end
  end
end
