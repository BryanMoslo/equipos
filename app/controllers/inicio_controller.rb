class InicioController < ApplicationController
	include Servicios
	def casa
		idrol = session[:idrol]
		@opciones = Opcione.joins("INNER JOIN rol_opcion_operaciones ON rol_opcion_operaciones.idoperacion = opciones.id").where("rol_opcion_operaciones.idrol = #{idrol} and rol_opcion_operaciones.estadorolop = 'A' and opciones.estadoopcion = 'A'")
		pp @opciones
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
