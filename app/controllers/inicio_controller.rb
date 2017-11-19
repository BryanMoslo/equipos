class InicioController < ApplicationController
	include Servicios
	def casa
		idrol = session[:idrol]
		@opciones = Opcione.all.solo_activos.order_opcions
		session[:opciones] =  @opciones
		@html = "<ul id='tree1'>"
		@opciones.each do |o|
			if o.idpadre==nil
				@html+="<li><a href='"+o.controller+"'>"+o.opcion+"</a>"+Recursividad(o.id)+"</li>"
			end
		end
		@html += "</ul>"
		render layout: "application"
		#redirect_to "http://elheraldo.co"	
		#render html: "<h1>Hola mundo cruel</h1>".html_safe
		#render file: "public/404.html"
	end
	
end
