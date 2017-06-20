class CharactersController < ApplicationController
	def index
		@characters = Character.all
	end
end