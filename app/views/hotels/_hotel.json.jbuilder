json.extract! hotel, :id, :nome, :endereco, :numeroQuartos, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
