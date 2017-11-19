# == Schema Information
#
# Table name: personas
#
#  id                   :integer          not null, primary key
#  nombre               :string
#  apellido             :string
#  identification       :string
#  correo               :string
#  idEstado             :integer
#  idTipo               :integer
#  idArea               :integer
#  idCargo              :integer
#  idTipoIdentificacion :integer
#  eliminado            :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Persona < ApplicationRecord
  validates :persona, uniqueness: { message: "cedula existe, por favor verifique" }
end
