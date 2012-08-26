class CreateReminderTaskLists < ActiveRecord::Migration
  def self.up
    create_table :reminder_task_lists do |t|
      t.integer :reminders_main_id

      t.timestamps
    end
  end

  def self.down
    drop_table :reminder_task_lists
  end
end
