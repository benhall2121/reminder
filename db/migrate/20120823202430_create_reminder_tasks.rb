class CreateReminderTasks < ActiveRecord::Migration
  def self.up
    create_table :reminder_tasks do |t|
      t.integer :reminders_main_id

      t.timestamps
    end
  end

  def self.down
    drop_table :reminder_tasks
  end
end
