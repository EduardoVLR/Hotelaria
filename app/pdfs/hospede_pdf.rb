class HospedePdf < Prawn::Document
    def initialize(hospedes)
        super()
        @hospedes = Hospede.order("id DESC").all
        text "Lista de Hóspedes", size: 30, style: :bold, aling: :center
        hospede_id
    end

    # Estilo da tabela
    def hospede_id
        table hospede_id_all do
            row(0).font_style = :bold
            columns(1..3).aling = :center
            self.row_colors = ["DDDDDD","FFFFFF"]
            self.header = true
        end
    end

    def hospede_id_all
        [["ID", "Nome", "Email", "Telefone", "Data de nascimento"]]+
        @hospedes.map do |hospede|
            [hospede.id,hospede.nome, hospede.email, hospede.telefone, hospede.data_nascimento]
        end
    end
    
end