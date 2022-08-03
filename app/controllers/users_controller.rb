# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize_user, only: %i[show edit update destroy]
  before_action :set_user, only: %i[show edit update destroy makeAdmin unmakeAdmin]
  def show
    @user = User.find(params[:id])
    @earned_rewards = RewardsEarnedList.where(UID: @user.UID)
  end

  def about
    @officers = User.where(is_officer: true)
  end

  def account
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.points = 0
    @user.rewards_earned = 0
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = 'Welcome to the App!'
      redirect_to(events_path)
    else
      render('new')
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to(users_url(@user), notice: 'User was successfully updated.') }
        format.json { render(:show, status: :ok, location: @user) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @user.errors, status: :unprocessable_entity) }
      end
    end
  end

  def applyOfficer
    set_user
  end

  def makeAdmin
    @makeAdmin = User.find(params[:id])
    @makeAdmin.update_attribute(:is_admin, true)
    @makeAdmin.update_attribute(:is_officer, true)
    @makeAdmin.update_attribute(:position, 'Officer')
    redirect_to(users_url)
  end

  def unmakeAdmin
    @unmakeAdmin = User.find(params[:id])
    @unmakeAdmin.update_attribute(:is_admin, false)
    @unmakeAdmin.update_attribute(:position, 'Member')
    redirect_to(users_url)
  end

  def delete
    @user = User.find(params[:id])
  end

  def applyOfficer
    @apply_officer = User.find(params[:id])
  end

  def acceptOfficer
    @make_officier = User.find(params[:id])
    @make_officier.update_attribute(:officer_apply, true)
    redirect_to(account_user_path(id: current_user.id), notice: 'Officer application was successfully sent.')
  end

  def makeOfficer
    @makeOfficier = User.find(params[:id])
    @makeOfficier.update_attribute(:is_officer, true)
    @makeOfficier.update_attribute(:officer_apply, false)
    @makeOfficier.update_attribute(:position, 'Officer')
    redirect_to(users_path, notice: 'Officer application was successfully accepted.')
  end

  def unmakeOfficer
    @unmake_officier = User.find(params[:id])
    @unmake_officier.update_attribute(:is_officer, false)
    @unmake_officier.update_attribute(:is_admin, false)
    @unmake_officier.update_attribute(:officer_apply, false)
    @unmake_officier.update_attribute(:position, 'Member')
    redirect_to(users_path, notice: 'Officer application was successfully denied.')
  end

  # DELETE /points/1 or /points/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to(users_url, notice: 'User was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :UID, :password,
                                 :password_confirmation, :points, :rewards_earned, :is_officer, :is_admin, :officer_apply)
  end
end
