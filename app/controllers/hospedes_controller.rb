class HospedesController < ApplicationController
  before_action :set_hospede, only: %i[ show edit update destroy ]
  before_action :authenticate_adm!

  # GET /hospedes or /hospedes.json
  def index
    # Paginação
    @hospedes = Hospede.page params[:page]

    # PDF
    respond_to do |format|
      format.html
      format.pdf do 
        pdf = HospedePdf.new(@hospedes)
        send_data pdf.render, filename: 'hospede.pdf', type: 'application/pdf', disposition: "inline"
      end
    end

  end

  # GET /hospedes/1 or /hospedes/1.json
  def show
  end

  # GET /hospedes/new
  def new
    @hospede = Hospede.new
  end

  # GET /hospedes/1/edit
  def edit
  end

  # POST /hospedes or /hospedes.json
  def create
    @hospede = Hospede.new(hospede_params)

    respond_to do |format|
      if @hospede.save
        format.html { redirect_to @hospede, notice: "Hóspede cadastrado com sucesso." }
        format.json { render :show, status: :created, location: @hospede }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hospede.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hospedes/1 or /hospedes/1.json
  def update
    respond_to do |format|
      if @hospede.update(hospede_params)
        format.html { redirect_to @hospede, notice: "Hóspede atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @hospede }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hospede.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospedes/1 or /hospedes/1.json
  def destroy
    @hospede.destroy
    respond_to do |format|
      format.html { redirect_to hospedes_url, notice: "Hóspede apagado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospede
      @hospede = Hospede.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hospede_params
      params.require(:hospede).permit(:nome, :email, :telefone, :data_nascimento)
    end
end
