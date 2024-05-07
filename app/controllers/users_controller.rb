class UsersController < ApplicationController
  before_action :set_user, only: %i(destroy)

  def index
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: "User was successfully created." }
        format.json { render :index, status: :created, location: @user }
        format.js {}
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.js
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
