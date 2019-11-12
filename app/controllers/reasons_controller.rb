class ReasonsController < ApplicationController
  before_action :set_reason, only: [:show, :update, :destroy]

  # GET /reasons
  def index
    @reasons = Reason.all

    render json: @reasons
  end

  # GET /reasons/1
  def show
    render json: @reason
  end

  # POST /reasons
  def create
    @reason = Reason.new(reason_params)

    if @reason.save
      render json: @reason, status: :created, location: @reason
    else
      render json: @reason.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reasons/1
  def update
    if @reason.update(reason_params)
      render json: @reason
    else
      render json: @reason.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reasons/1
  def destroy
    @reason.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reason
      @reason = Reason.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reason_params
      params.require(:reason).permit(:title)
    end
end
