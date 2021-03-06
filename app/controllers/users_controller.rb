class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    users = User.all
    page_number = params[:page_number].to_i
    limit_per_page = 20
    @users = User.limit(20).offset(limit_per_page  * (page_number - 1))
  end

  def users_paginated
    users = User.all
    page_number = params[:page_number].to_i
    limit_per_page = 20
    @users = User.limit(20).offset(limit_per_page  * (page_number - 1))
  end

  def users_paginated_ajax
    users = User.all
    page_number = params[:page_number].to_i
    limit_per_page = 20
    @users = User.limit(20).offset(limit_per_page  * (page_number - 1))
    respond_to do |format|
      format.json { render json: @users }
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :business)
    end
end
