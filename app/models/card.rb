class Card < ActiveRecord::Base
	before_validation :add_review_date

	def add_review_date
		self.review_date = Time.now.strftime("%d/%m/%Y")
	end
end
