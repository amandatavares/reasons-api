class UsersController < ApplicationController
  before_action :authorize_request, except: [:create,:logout]
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user.as_json(except: [:password_digest])
  end

  # POST /users
  def create
    puts "============="
    puts user_params
    puts "============="
    @user = User.new(user_params)

    if @user.save
      render json: @user.as_json(except: [:password_digest]), status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user.as_json(except: [:password_digest])
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def current
    render json: {result: @current_user.as_json(except: [:password_digest])}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:name, :email, :password)
    end
end
