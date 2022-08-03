# frozen_string_literal: true

class AttendeeListsController < ApplicationController
  before_action :authorize_user
  before_action :set_attendee_list, only: %i[show edit update destroy]

  # GET /attendee_lists or /attendee_lists.json
  def index
    @attendee_lists = AttendeeList.all
  end

  # GET /attendee_lists/1 or /attendee_lists/1.json
  def show; end

  # GET /attendee_lists/new
  def new
    @attendee_list = AttendeeList.new
  end

  # GET /attendee_lists/1/edit
  def edit; end

  # POST /attendee_lists or /attendee_lists.json
  def create
    @attendee_list = AttendeeList.new(attendee_list_params)

    respond_to do |format|
      if @attendee_list.save
        format.html { redirect_to(attendee_list_url(@attendee_list), notice: 'Attendee list was successfully created.') }
        format.json { render(:show, status: :created, location: @attendee_list) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @attendee_list.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /attendee_lists/1 or /attendee_lists/1.json
  def update
    respond_to do |format|
      if @attendee_list.update(attendee_list_params)
        format.html { redirect_to(attendee_list_url(@attendee_list), notice: 'Attendee list was successfully updated.') }
        format.json { render(:show, status: :ok, location: @attendee_list) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @attendee_list.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /attendee_lists/1 or /attendee_lists/1.json
  def destroy
    @attendee_list.destroy!

    respond_to do |format|
      format.html { redirect_to(attendee_lists_url, notice: 'Attendee list was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attendee_list
    @attendee_list = AttendeeList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def attendee_list_params
    params.require(:attendee_list).permit(:attendee_list_id, :UID)
  end
end
