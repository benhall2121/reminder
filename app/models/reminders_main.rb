class RemindersMain < ActiveRecord::Base
  has_many :reminderSchedules
  has_many :reminderMessages

  accepts_nested_attributes_for :reminderMessages, :reject_if => lambda { |a| a[:message].blank? }, :allow_destroy => true

end
