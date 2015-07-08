class Profile < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	validates :description, :mmr, presence: true
	validates :mmr, numericality: { greater_than: 0, less_than: 9999 }
	validates :description, length: {minimum: 100, maximum: 1000}
	validates :image, file_size: { less_than_or_equal_to: 500.kilobytes }

	
	belongs_to :language, :class_name => Language, :foreign_key => :language_id
	belongs_to :hero, :class_name => Hero, :foreign_key => :hero_id
	belongs_to :user
	validates_uniqueness_of :user_id, :message => "already has a profile"
	validates :dotabuff, format: { with: /\Ahttps?:\/\/.*\z/,
 	message: "must start with http:// or https://" }, :allow_blank => true




end
