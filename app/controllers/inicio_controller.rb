class InicioController < ApplicationController

	def index
		@usuarios = Usuario.all
		@equipos = []
	end

	def usuarios
		@model = Usuario.all

		render json: @model
	end

	def equipos
		render json: {}
	end
end
