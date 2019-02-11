class Attendance < ApplicationRecord
  after_create :attendance_send

  def attendance_send
    UserMailer.new_attendance(self).deliver_now
  end
  
  belongs_to :user
  belongs_to :event
end
