module Servicios
   require 'digest/md5'
   def TraerValorParametro(params)	    
	      unless params.nil?
	        ValorParametro.find(params).valor
	      end  
   end

    def Recursividad(padre)
      @opciones = session[:opciones]
      aux = false
      controller = ""
      html = "<ul>"
      @opciones.each do |o|
        if o.idpadre==padre
          aux = true
          if o.controller == "" || o.controller == nil
            controller = "#"
          else
            controller = o.controller
          end
          puts controller
          html+="<li><a href='"+controller+"'>"+o.opcion+"</a>"+Recursividad(o.id)+"</li>"
        end
      end
      if aux
        return html += "</ul>"
      else
        return ""
      end
    end

   def TraerParametros(params)
	   	unless params.nil?
		     ValorParametro.where(["parametroId ='#{params}'"]).select(:valor,:id) 
		end 
   end   

   def Encriptar(params)
       unless params.nil?       
          res = Digest::MD5.hexdigest(params)
          return res  
       end 
    end
end