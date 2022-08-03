# frozen_string_literal: true

class RewardsController < ApplicationController
  before_action :authorize_user
  before_action :set_reward, only: %i[show edit update destroy]

  # GET /rewards or /rewards.json
  def index
    @rewards = Reward.all.sort_by { |reward| -reward.reward_points }
    @pending_rewards = RewardsApprovalList.all
    @earned_rewards = RewardsEarnedList.where(UID: current_user.UID)
    @rewardCheck = Reward.all
  end

  # GET /rewards/1 or /rewards/1.json
  def show; end

  # GET /rewards/new
  def new
    @reward = Reward.new
  end

  # GET /rewards/1/edit
  def edit; end

  # POST /rewards or /rewards.json
  def create
    @reward = Reward.new(reward_params)

    respond_to do |format|
      if @reward.save
        format.html { redirect_to(reward_url(@reward), notice: 'Reward was successfully created.') }
        format.json { render(:show, status: :created, location: @reward) }
      else
				# :nocov:
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @reward.errors, status: :unprocessable_entity) }
				# :nocov:
      end
    end
  end

  # PATCH/PUT /rewards/1 or /rewards/1.json

  def update
		# :nocov:
    respond_to do |format|
      if @reward.update(reward_params)
        format.html { redirect_to(reward_url(@reward), notice: 'Reward was successfully updated.') }
        format.json { render(:show, status: :ok, location: @reward) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @reward.errors, status: :unprocessable_entity) }
      end
    end
		# :nocov:
  end

  def delete
		# :nocov:
    @reward = Reward.find(params[:id])
		# :nocov:
  end

  # DELETE /rewards/1 or /rewards/1.json
  def destroy
		# :nocov:
    @reward.destroy

    respond_to do |format|
      format.html { redirect_to(rewards_url, notice: 'Reward was successfully deleted.') }
      format.json { head(:no_content) }
    end
		# :nocov:
  end

  def redeem
		# :nocov:
    @reward = Reward.find(params[:id])
		# :nocov:
  end

  def accept
		# :nocov:
    set_reward
    @member = current_user
    if current_user.points < @reward.reward_points
      redirect_to(:rewards, notice: 'You do not have enough points for that reward.')
    else
      current_user.update_attribute(:points, @member.points - @reward.reward_points)
      @new_reward = RewardsApprovalList.create!(reward_name: @reward.reward_name, UID: @member.UID)
      redirect_to(:rewards, notice: 'You have successfully accepted reward!')
    end
		# :nocov:
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reward
    @reward = Reward.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reward_params
    params.require(:reward).permit(:reward_name, :reward_points, :reward_description)
  end
end
