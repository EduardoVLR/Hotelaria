class ReservaPdf < Prawn::Document
    def initialize(reservas)
        super()
        @reservas = Reserva.order("id DESC").all
        text "Lista de Reservas", size: 30, style: :bold, aling: :center
        reserva_id
    end

    # Estilo da tabela
    def reserva_id
        table reserva_id_all do
            row(0).font_style = :bold
            columns(1..3).aling = :center
            self.row_colors = ["DDDDDD","FFFFFF"]
            self.header = true
        end
    end

    def reserva_id_all
        [["ID", "Hotel", "Quarto", "Data de Entrada", "Data de Saída"]]+
        @reservas.map do |reserva|
            [reserva.id,reserva.hotel.nome, reserva.quarto, reserva.dataEntrada, reserva.dataSaida]
        end
    end
    
end