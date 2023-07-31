class Event < ApplicationRecord
  belongs_to :user
  # has_many :comments
  # has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :title, :description, :category_id, :meeting_place, :return_place, :distance, :climbing, :start_time, :end_time, :capacity, :user, :image,
            presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }

end