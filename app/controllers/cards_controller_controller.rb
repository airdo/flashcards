class CardsControllerController < ApplicationController
	def index
		@cards = Card.all
		render text: @cards.map { |x| 
			"Text: #{x.original_text} - Translation: #{x.translated_text} <br/> Updated: #{x.review_date}"
		}.join("<hr>")
	end

	def new
		render text "BOY"
	end
end
