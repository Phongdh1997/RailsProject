

class Product < ApplicationRecord
	
	extend Enumerize
	enumerize :level, in: [:easy, :medium, :hard], default: :easy
	enumerize :country, in: ISO3166::Country.translations, default: :Germany
	enumerize :title, in: [:ruby, :medium, :hard], default: :ruby

	validates :title, :description, presence: true
	validate :title_is_shorter_than_description
	scope :price, -> (price) {where('price < ?', price)}
	before_save :strip_html_from_description
	def strip_html_from_description
		self.description = ActionView::Base.full_sanitizer.sanitize(self.description)
	end
	def title_is_shorter_than_description
		return if title.blank? || description.blank?
		if description.length < title.length
			errors.add(:description, 'can\'t be shorter than title')
		end
	end
end