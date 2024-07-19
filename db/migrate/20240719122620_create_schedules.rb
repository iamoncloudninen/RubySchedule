class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.datetime :startDate
      t.datetime :endDate
      t.boolean :allDay
      t.text :scheduleMemo

      t.timestamps
    end
  end
end
