module Servicios
  require 'digest/md5'
  def TraerValorParametro(params)
    unless params.nil?
      ValorParametro.find(params).valor
    end
  end

  def TraerOpcionesParametros(params)

    unless params.nil?
      parametros = Parametro.where(atributo: params)
      unless parametros.blank?
        parametroId = parametros.first.id

        ValorParametro.where(parametro_id: parametroId).select(:valor, :id)
      end
    end
  end

  def Encriptar(params)
    unless params.nil?
      res = Digest::MD5.hexdigest(params)
      return res
    end
  end
end
