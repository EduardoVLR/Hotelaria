class Hospede < ApplicationRecord
    has_many :reservas, dependent: :delete_all

    validates :nome, presence: true
    validates :nome, uniqueness: true
    validates :telefone, length: { in: 8..8 }

    paginates_per 5
end
