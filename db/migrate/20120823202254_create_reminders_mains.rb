class CreateRemindersMains < ActiveRecord::Migration
  def self.up
    create_table :reminders_mains do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :reminders_mains
  end
end
