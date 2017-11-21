# == Schema Information
#
# Table name: opciones
#
#  id           :integer          not null, primary key
#  idpadre      :integer
#  opcion       :string
#  url          :string
#  estadoopcion :string
#  orden        :string
#  eshoja       :boolean
#  controller   :string
#  eliminado    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Opcione < ApplicationRecord
	has_many :rol_opcion_operacione
	scope :solo_activos, -> { where(estadoopcion: 'A')   }
	scope :order_opcions, -> { order(orden: :asc)   }
end
