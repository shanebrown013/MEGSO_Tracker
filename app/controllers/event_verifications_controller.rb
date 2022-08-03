class EventVerificationsController < ApplicationController
  before_action :authorize_user
  before_action :set_event_verification, only: %i[ show edit update destroy ]

  # GET /event_verifications or /event_verifications.json
  def index
    @event_verifications = EventVerification.all
  end

  # GET /event_verifications/1 or /event_verifications/1.json
  def show
  end

  # GET /event_verifications/new
  def new
    @event_verification = EventVerification.new
  end

  # GET /event_verifications/1/edit
  def edit
  end

  # POST /event_verifications or /event_verifications.json
  def create
    @event_verification = EventVerification.new(event_verification_params)

    respond_to do |format|
      if @event_verification.save
        format.html { redirect_to event_verification_url(@event_verification), notice: "Event verification was successfully created." }
        format.json { render :show, status: :created, location: @event_verification }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_verification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_verifications/1 or /event_verifications/1.json
  def update
    @registered_event = Event.where(id: @event_verification.event_id).first
    @event_id = @registered_event.event_attendee_list_id
    respond_to do |format|
      if @event_verification.update(event_verification_params)
        if @event_verification.event_verification == @registered_event.event_verification
          @new_event = AttendeeList.create!(attendee_list_id: @event_id, UID: current_user.UID)
          current_user.update_attribute(:points, current_user.points + @registered_event.event_point)
          format.html { redirect_to events_path, notice: "Successfully registed for event." }
        else
          format.html { redirect_to events_path, notice: "Incorrect event verification code." }
          @event_verification.destroy
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_verification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_verifications/1 or /event_verifications/1.json
  def destroy
    @event_verification.destroy

    respond_to do |format|
      format.html { redirect_to event_verifications_url, notice: "Event verification was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_verification
      @event_verification = EventVerification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_verification_params
      params.require(:event_verification).permit(:event_verification)
    end
end
