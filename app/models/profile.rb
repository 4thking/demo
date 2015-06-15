class Profile < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	validates :description, :mmr, presence: true
	validates :mmr, numericality: { greater_than: 0, less_than: 9999 }

	belongs_to :user
	validates_uniqueness_of :user_id, :message => "already has a profile"
	validates :dotabuff, format: { with: /\Ahttps?:\/\/.*\z/,
 	message: "must start with http:// or https://" }, :allow_blank => true


end
