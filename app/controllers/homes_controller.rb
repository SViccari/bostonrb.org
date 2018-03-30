class HomesController < ApplicationController
  def show
    @upcoming_event = MeetupService.fetch_upcoming_event
  end
end
