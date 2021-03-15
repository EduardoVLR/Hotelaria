class Reserva < ApplicationRecord
    belongs_to :hotel  # foreign key - hotel_id
    belongs_to :hospede  # foreign key - hospede_id

    validates :hotel, presence: true
    validates :hospede, presence: true

    paginates_per 5
end
