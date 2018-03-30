class MeetupEvent
  def initialize(event_json)
    @event_json = event_json
  end
  
  def address_1
    event_json["venue"]["address_1"]  
  end
  
  def city
    event_json["venue"]["city"]  
  end
  
  def ends_at
    starts_at + duration_seconds
  end
  
  def name
    event_json["name"]
  end
  
  def starts_at
    Time.at(event_json["time"]/1000).utc
  end
  
  def state
    event_json["venue"]["state"]  
  end
  
  def venue_name
    event_json["venue"]["name"]  
  end
  
  private
  
  attr_reader :event_json
  
  def duration_seconds
    (event_json["duration"]/1000).seconds
  end
  
  def utc_offset_hours
    event_json["utc_offset"]/1000/60/60
  end
end