class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances
  has_many :comments
  has_many_attached :images

  def available_slots
    capacity - attendances.count
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :title, :description, :category_id, :meeting_place, :return_place, :distance, :climbing, :start_time, :end_time, :capacity, :user, :images,
            presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :capacity, :distance, :climbing, presence: true, numericality: { greater_than: 0 }
  validate :date_before_start
  validate :date_before_end

  def date_before_start
    return if start_time.blank?

    errors.add(:start_time, 'は今日以降のものを選択してください') if start_time < Time.zone.today
  end

  def date_before_end
    return if end_time.blank? || start_time.blank?

    errors.add(:end_time, 'は開始日以降のものを選択してください') if end_time < start_time
  end
end
