
class UsuariosController < BaseController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  include Servicios
  # GET /usuarios
  # GET /usuarios.json
  require "pp"
  layout "application2"

  def index
    @usuarios = Usuario.all
    @roles = Servicios.TraerParametros(2)
    @estados = Servicios.TraerParametros(1)
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @rol = Servicios.TraerValorParametro(@usuario.idrol)
    @estado= Servicios.TraerValorParametro(@usuario.idestadousuario)
  end

  # GET /usuarios/new
  def new
  end

  # GET /usuarios/1/edit
  def edit
    @roles = Servicios.TraerParametros(2)
    @estados = Servicios.TraerParametros(1)
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
      redirect_to usuarios_path
    else
      format.html { render :new }
      format.json { render json: @usuario.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    if @usuario.update(usuario_params)
      redirect_to usuarios_path
    else
      format.html { render :edit }
      format.json { render json: @usuario.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy

    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
         params.require(:usuario).permit(:usuario, :password, :idrol, :idestadousuario)
    end
end
