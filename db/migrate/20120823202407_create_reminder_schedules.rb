class CreateReminderSchedules < ActiveRecord::Migration
  def self.up
    create_table :reminder_schedules do |t|
      t.datetime :triggerAt
      t.boolean :countdown
      t.integer :reminders_main_id

      t.timestamps
    end
  end

  def self.down
    drop_table :reminder_schedules
  end
end
