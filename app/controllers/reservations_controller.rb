class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :returned, :update, :destroy]
  before_action :authenticate_user!
  before_filter :require_permission, only: :edit

  def require_permission
    if current_user != Reservation.find(params[:id]).user
      redirect_to root_path
      #Or do something else here
    end
  end


  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = current_user.reservations
    @rentals_c = []
    @rentals_o = []
    @offers = []
    current_user.items.each() do |i|
      i.reservations.each() do |r|
        if r.returned
          @rentals_o<<r
        elsif not r.accepted
          @offers<<r
        elsif r.accepted and not r.returned
          @rentals_c<<r
        end
      end
    end
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
    @to_do = Reservation.find(params[:id])
    print(params)
    if params[:type] == "acc"
      @to_do.update_attributes(accepted: true)
    elsif params[:type] == "ret"
      @to_do.update_attributes(returned: trues)
    end
    redirect_to "reservation#index"
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:return_date, :returned, :item_id, :user_id)
    end
end
