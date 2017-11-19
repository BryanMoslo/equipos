class SeguridadController < ApplicationController
    skip_before_action:verify_authenticity_token #desactiva el control de autencicidad del la solicitud
 require "pp"
 include Servicios 
 def login 
 	render  layout: 'application1'
 end
   
 def autenticar
 	xpass=Encriptar(params[:password])
    xusuario=Usuario.where(usuario:params[:usuario],password:xpass)
    
    if xusuario != []
	    session[:usuario]=xusuario.map(&:usuario)[0]	    
	    session[:idusuario]=xusuario.map(&:id)[0]
	    session[:idrol]=xusuario.map(&:idrol)[0]
	    session[:logueado]=true
	    redirect_to "/inicio"
	else 
		flash.alert="Usuario y/o password incorrecto. Verifique"
	    redirect_to "/"  
    end
 end

 def logout
        session[:usuario]=nil
	    session[:idusuario]=nil
	    session[:idrol]=nil
	    session[:logueado]=false
        redirect_to "/"
 end

end
