class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances
  # has_many :comments
  has_many_attached :images

  def available_slots
    capacity - attendances.count
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :title, :description, :category_id, :meeting_place, :return_place, :distance, :climbing, :start_time, :end_time, :capacity, :user, :images,
            presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :capacity, presence: true, numericality: { greater_than: 0 }
end
