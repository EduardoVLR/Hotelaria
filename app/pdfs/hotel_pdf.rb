class HotelPdf < Prawn::Document
    def initialize(hotels)
        super()
        @hotels = Hotel.order("id DESC").all
        text "Lista de Hotéis", size: 30, style: :bold, aling: :center
        hotel_id
    end

    # Estilo da tabela
    def hotel_id
        table hotel_id_all do
            row(0).font_style = :bold
            columns(1..3).aling = :center
            self.row_colors = ["DDDDDD","FFFFFF"]
            self.header = true
        end
    end

    def hotel_id_all
        [["ID", "Nome", "Endereço", "Nº de quartos"]]+
        @hotels.map do |hotel|
            [hotel.id,hotel.nome, hotel.endereco, hotel.numeroQuartos]
        end
    end
    
end