class InicioController < ApplicationController
	def casa	
	 render layout: "application"
	 p session[:logueado]
	 #redirect_to "http://elheraldo.co"	
	 #render html: "<h1>Hola mundo cruel</h1>".html_safe
	 #render file: "public/404.html"
	end
	
end
