class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendees, foreign_key: "attended_event_id"
  has_many :users, through: :attendees, source: :attendee

  scope :past, -> { where("date < ?", Time.now) }
  scope :upcoming, -> { where("date > ?", Time.now) }
end
