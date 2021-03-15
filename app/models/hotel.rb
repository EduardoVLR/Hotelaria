class Hotel < ApplicationRecord
    has_many :reservas
    
    validates :nome, presence: true
    validates :nome, uniqueness: true
    validates :endereco, presence: true
    validates :endereco, uniqueness: true
    
    paginates_per 5
end