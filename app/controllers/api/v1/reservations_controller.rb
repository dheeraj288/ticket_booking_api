class Api::V1::ReservationsController < ApiController
	def index
		@reservations = Reservation.all
		render json: @reservations, status: :ok
	end

    def show
        reservation = Reservation.find(params[:id])
        render json: reservation, status: :ok
    end

	def create
		    @reservation = Reservation.new(reservation_params)
            if @reservation.save
            render json: @reservation, status: :created
        else
            render json: { data: @reservation.errors.full_messages, status: "failed" },
            status: :unprocessable_entity
        end
    end

    def history
         @reservations = Reservation.history
         render json: @reservations
    end 

    def upcoming
        @reservations = Reservation.upcoming
        render json: @reservations
  end

    private

    def reservation_params
    	params.require(:reservation).permit(:date,:number_of_guests, :phone, :name, :email, :user_id)
    end
end





