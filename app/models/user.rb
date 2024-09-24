class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
  has_many :attendees, foreign_key: "attendee_id"
  has_many :attended_events, through: :attendees, source: :attended_event

  def attending?(event)
    event.users.include?(self)
  end

  def attend!(event)
    self.attendees.create!(attended_event_id: event.id)
  end

  def cancel!(event)
    self.attendees.find_by(attended_event_id: event.id).destroy
  end
end
