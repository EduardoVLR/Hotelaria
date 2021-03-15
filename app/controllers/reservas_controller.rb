class ReservasController < ApplicationController

  before_action :set_reserva, only: %i[ show edit update destroy ]
  before_action :set_hotel_options, only: [:new, :create, :edit, :update]
  before_action :set_hospede_options, only: [:new, :create, :edit, :update]
  before_action :authenticate_adm!

  # GET /reservas or /reservas.json
  def index
    # Paginação
    @reservas = Reserva.page params[:page]

    # PDF
    respond_to do |format|
      format.html
      format.pdf do 
        pdf = ReservaPdf.new(@reservas)
        send_data pdf.render, filename: 'reserva.pdf', type: 'application/pdf', disposition: "inline"
      end
    end

  end

  # GET /reservas/1 or /reservas/1.json
  def show
  end

  # GET /reservas/new
  def new
    @reserva = Reserva.new
  end

  # GET /reservas/1/edit
  def edit
  end

  # POST /reservas or /reservas.json
  def create
    @reserva = Reserva.new(reserva_params)

    respond_to do |format|
      if @reserva.save
        format.html { redirect_to @reserva, notice: "Reserva feita com sucesso." }
        format.json { render :show, status: :created, location: @reserva }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservas/1 or /reservas/1.json
  def update
    respond_to do |format|
      if @reserva.update(reserva_params)
        format.html { redirect_to @reserva, notice: "Reserva atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @reserva }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1 or /reservas/1.json
  def destroy
    @reserva.destroy
    respond_to do |format|
      format.html { redirect_to reservas_url, notice: "Reserva apagada com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    def set_hotel_options
      @hotel_options = Hotel.all.pluck(:nome, :id)
    end

    def set_hospede_options
      @hospede_options = Hospede.all.pluck(:nome, :id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @reserva = Reserva.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reserva_params
      params.require(:reserva).permit(:hotel_id, :hospede_id, :quarto, :dataEntrada, :dataSaida)
    end
end
