class CardsControllerController < ApplicationController
	def index
		@cards = Card.all
	end

	 def new
	 	@card = Card.new
	 end
	 
	 def create
	 	@card = Card.create(card_params)

	 	@card.save
	 	redirect_to url:cards_controller_index_url
	 end

	 def destroy
	 	@card = Card.find(params[:id])
	 	@card.destroy

	 	redirect_to cards_controller_index_url
	 end


	 private
	 def card_params
	 	params.require(:cards_controller).permit(:translated_text,:original_text)
	 end



end
