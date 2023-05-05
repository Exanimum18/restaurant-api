class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :table

  validate :validar_maximas_reservaciones

  def validar_maximas_reservaciones
    if Reservation.count >= 2 #cambarlo por 20
      errors.add(:base, "No se pueden crear más de 20 reservaciones entre todos los restaurantes")
    end
  end
end
