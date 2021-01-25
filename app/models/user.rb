class User < ApplicationRecord
  has_many :event_attendings, foreign_key: :event_attendee_id
  has_many :attended_event, through: :event_attendings
  has_many :hosted_event, foreign_key: :host_id, class_name: "Event"
end
