class CardsControllerController < ApplicationController
	def index
		@cards = Card.all
	end

	def show
		@card = Card.find(params[:id])
	end

	def new
		@card = Card.new
	end

	def create
		@card = Card.create(card_params)

		@card.save
		redirect_to url:cards_controller_index_url
	end

	def edit
		@card = Card.find(params[:id])
	end

	def update
		@card = Card.find(params[:id])

		if @card.update(card_params)
			redirect_to cards_controller_path
		else
			render 'edit'
		end
	end

	 def destroy
	 	@card = Card.find(params[:id])
	 	@card.destroy

	 	redirect_to cards_controller_index_url
	 end


	 private
	 def card_params
	 	params.require(:card).permit(:translated_text,:original_text)
	 end



end
