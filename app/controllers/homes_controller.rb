class HomesController < ApplicationController
  def show
    @upcoming_event = fetch_upcoming_event
  end
  
  private
  
  def fetch_upcoming_event
    Rails.cache.fetch("upcoming_meetup_event", expires_in: 2.hours) do
      MeetupService.fetch_upcoming_event
    end
  end
end
