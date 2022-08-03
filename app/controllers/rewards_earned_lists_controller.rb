class RewardsEarnedListsController < ApplicationController
  before_action :authorize_user
  before_action :set_rewards_earned_list, only: %i[ show edit update destroy ]

  # GET /rewards_earned_lists or /rewards_earned_lists.json
  def index
    @rewards_earned_lists = RewardsEarnedList.all
  end

  # GET /rewards_earned_lists/1 or /rewards_earned_lists/1.json
  def show
  end

  # GET /rewards_earned_lists/new
  def new
    @rewards_earned_list = RewardsEarnedList.new
  end

  # GET /rewards_earned_lists/1/edit
  def edit
  end

  # POST /rewards_earned_lists or /rewards_earned_lists.json
  def create
    @rewards_earned_list = RewardsEarnedList.new(rewards_earned_list_params)

    respond_to do |format|
      if @rewards_earned_list.save
        format.html { redirect_to rewards_earned_list_url(@rewards_earned_list), notice: "Rewards earned list was successfully created." }
        format.json { render :show, status: :created, location: @rewards_earned_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rewards_earned_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rewards_earned_lists/1 or /rewards_earned_lists/1.json
  def update
    respond_to do |format|
      if @rewards_earned_list.update(rewards_earned_list_params)
        format.html { redirect_to rewards_earned_list_url(@rewards_earned_list), notice: "Rewards earned list was successfully updated." }
        format.json { render :show, status: :ok, location: @rewards_earned_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rewards_earned_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rewards_earned_lists/1 or /rewards_earned_lists/1.json
  def destroy
    @rewards_earned_list.destroy

    respond_to do |format|
      format.html { redirect_to rewards_earned_lists_url, notice: "Rewards earned list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rewards_earned_list
      @rewards_earned_list = RewardsEarnedList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rewards_earned_list_params
      params.require(:rewards_earned_list).permit(:reward_name, :UID)
    end
end
