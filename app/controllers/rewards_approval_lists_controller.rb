# frozen_string_literal: true

class RewardsApprovalListsController < ApplicationController
  before_action :authorize_user
  before_action :set_rewards_approval_list, only: %i[show edit update destroy]

  # GET /rewards_approval_lists or /rewards_approval_lists.json
  def index
    @rewards_approval_lists = RewardsApprovalList.all
  end

  # GET /rewards_approval_lists/1 or /rewards_approval_lists/1.json
  def show; end

  # GET /rewards_approval_lists/new
  def new
    @rewards_approval_list = RewardsApprovalList.new
  end

  # GET /rewards_approval_lists/1/edit
  def edit; end

  # POST /rewards_approval_lists or /rewards_approval_lists.json
  def create
    @rewards_approval_list = RewardsApprovalList.new(rewards_approval_list_params)

    respond_to do |format|
      if @rewards_approval_list.save
        format.html { redirect_to(rewards_approval_list_url(@rewards_approval_list), notice: 'Rewards approval list was successfully created.') }
        format.json { render(:show, status: :created, location: @rewards_approval_list) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @rewards_approval_list.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /rewards_approval_lists/1 or /rewards_approval_lists/1.json
  def update
    respond_to do |format|
      if @rewards_approval_list.update(rewards_approval_list_params)
        format.html { redirect_to(rewards_approval_list_url(@rewards_approval_list), notice: 'Rewards approval list was successfully updated.') }
        format.json { render(:show, status: :ok, location: @rewards_approval_list) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @rewards_approval_list.errors, status: :unprocessable_entity) }
      end
    end
  end

  def delete
    set_rewards_approval_list
    @member = User.where(UID: @rewards_approval_list.UID).first
    @reward = Reward.where(reward_name: @rewards_approval_list.reward_name).first
    @member.update_attribute(:points, @member.points + @reward.reward_points)
    @rewards_approval_list.destroy
    redirect_to(:rewards, notice: 'You have successfully given points back to the user.')
  end

  # DELETE /rewards_approval_lists/1 or /rewards_approval_lists/1.json
  def destroy
    @rewards_approval_list.destroy

    respond_to do |format|
      format.html { redirect_to(rewards_approval_lists_url, notice: 'Rewards approval list was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  def confirm
    set_rewards_approval_list
    @member = User.where(UID: @rewards_approval_list.UID).first
    @member.update_attribute(:rewards_earned, @member.rewards_earned + 1)
    @new_earned_reward = RewardsEarnedList.create!(reward_name: @rewards_approval_list.reward_name, UID: @rewards_approval_list.UID)
    @rewards_approval_list.destroy

    respond_to do |format|
      format.html { redirect_to(rewards_url, notice: 'Reward was successfully confirmed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rewards_approval_list
    @rewards_approval_list = RewardsApprovalList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def rewards_approval_list_params
    params.require(:rewards_approval_list).permit(:reward_name, :UID)
  end
end
