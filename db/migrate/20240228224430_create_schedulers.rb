class CreateSchedulers < ActiveRecord::Migration[7.1]
  def change
    create_table :schedulers do |t|
      t.string :timezone
      t.string :lessontime
      t.string :lessonday

      t.timestamps
    end
  end
end
