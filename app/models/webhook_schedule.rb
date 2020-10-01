class WebhookSchedule < ApplicationRecord
    serialize :time, Tod::TimeOfDay
    
    validates :webhook_url, presence: true
    validates :time, presence: true
end
