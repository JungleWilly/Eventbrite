class Attendance < ApplicationRecord
  after_create :more_participant_send

  def more_participant_send
    UserMailer.attendance_send(event, event.creator, user).deliver_now
  end
  
  belongs_to :user
  belongs_to :event
end
