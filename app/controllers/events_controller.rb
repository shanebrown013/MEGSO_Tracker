# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authorize_user
  before_action :set_event, only: %i[show edit update destroy delete]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
    @events = Event.all
    @attendees = AttendeeList.where(attendee_list_id: @event.event_attendee_list_id)
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    @attendee_list_id = generate_token

    @event.event_attendee_list_id = @attendee_list_id

    respond_to do |format|
      if @event.save
        format.html { redirect_to(event_url(@event), notice: 'Event was successfully created.') }
        format.json { render(:show, status: :created, location: @event) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @event.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to(event_url(@event), notice: 'Event was successfully updated.') }
        format.json { render(:show, status: :ok, location: @event) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @event.errors, status: :unprocessable_entity) }
      end
    end
  end

  def delete; end

  # DELETE /events/1 or /events/1.json
  def destroy
    set_event

    @delete_attendees = AttendeeList.where(attendee_list_id: @event.event_attendee_list_id)

    @delete_attendees.each(&:destroy)

    @event.destroy!

    respond_to do |format|
      format.html { redirect_to(events_url, notice: 'Event was successfully deleted.') }
      format.json { head(:no_content) }
    end
  end

  def list
    @event = Event.all
  end

  # Used to create an attendence list when the user hits a button
  def register
    set_event
    @event_id = @event.event_attendee_list_id
    @member = current_user
    @user_event_code = EventVerification.create!(event_id: @event.id)
    if AttendeeList.exists?(attendee_list_id: @event_id, UID: @member.UID)
      redirect_to(:events, notice: 'You have aleady registered for that event.')
    else
      #@new_event = AttendeeList.create!(attendee_list_id: @event_id, UID: @member.UID)
      redirect_to edit_event_verification_path(@user_event_code)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # generate id token
  def generate_token
    loop do
      token = SecureRandom.hex(10)

      break token unless Event.exists?(event_attendee_list_id: token)
    end
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:event_name, :event_point, :event_location, :event_date, :event_start, :event_end, :event_verification,
                                  :event_description)
  end
end