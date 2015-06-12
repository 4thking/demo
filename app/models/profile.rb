class Profile < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	validates :description, :steam, :mmr, presence: true
	validates :mmr, numericality: { greater_than: 0, less_than: 9999 }

	belongs_to :user
end
