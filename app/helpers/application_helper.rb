module ApplicationHelper
  include Servicios

  def obtener_valor_parametro(id)
    Servicios.TraerValorParametro(id) || []
  end

  def obtener_opciones(nombreParametro)
    Servicios.TraerOpcionesParametros(nombreParametro) || []
  end

  def status_class(status)
    return "fa-ban text-warning" if status == "Bloqueado"
    return "fa-check text-success" if status == "Activo"
    return "fa-times text-danger" if status == "Inactivo"
    return status
  end
end
