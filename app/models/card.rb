class Card < ActiveRecord::Base
	before_validation :add_review_date
	validates :translated_text, :original_text, :review_date, presence: true

	def add_review_date
		self.review_date = Time.now.strftime("%d/%m/%Y")
	end

	def text_not_equal_translation
		if translated_text.downcase == original_text.downcase
			errors.add(:translated_text, 'can`t be equal with original text')
		end
	end
end
