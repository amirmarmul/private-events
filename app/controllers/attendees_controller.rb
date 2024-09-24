class AttendeesController < ApplicationController
  def create
    @event = Attendee.find(params[:attendee][:attended_event_id])
    current_user.attend!(@event)
    redirect_to @event
  end

  def destroy
    @event = Attendee.find(params[:id]).attended_event
    current_user.cancel!(@event)
    redirect_to @event
  end
end
