class PersonasController < ApplicationController
  before_action :obtener_persona, only: [:show, :edit, :update, :destroy]

  layout "application2"

  def index
    @personas = Persona.all
  end

  def create
    persona = Persona.new(persona_params)
    persona.save

    redirect_to personas_path
  end

  def show
  end

  def edit
  end

  def update
    if @persona.update_attributes(persona_params)
      redirect_to personas_path
    end
  end

  def destroy
    @persona.destroy

    redirect_to personas_path
  end

  def obtener_persona
    @persona = Persona.find(params[:id])
  end

  private
    def persona_params
      params.require(:persona).permit(:nombre, :apellido, :identification, :correo, :idEstado, :idTipo, :idArea, :idCargo, :idTipoIdentificacion, :eliminado)
    end
end
