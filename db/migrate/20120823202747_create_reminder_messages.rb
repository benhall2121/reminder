class CreateReminderMessages < ActiveRecord::Migration
  def self.up
    create_table :reminder_messages do |t|
      t.text :message
      t.integer :reminders_main_id

      t.timestamps
    end
  end

  def self.down
    drop_table :reminder_messages
  end
end
