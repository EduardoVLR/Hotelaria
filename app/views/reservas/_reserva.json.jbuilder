json.extract! reserva, :id, :quarto, :dataEntrada, :dataSaida, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
