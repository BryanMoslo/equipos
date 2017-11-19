class InicioController < ApplicationController

	def index
		@personas = Persona.all
		@usuarios = Usuario.all
		@equipos = []
	end

	def personas
		@model = Persona.all

		render json: @model
	end

	def usuarios
		@model = Usuario.all

		render json: @model
	end

	def equipos
		render json: {}
	end
end
