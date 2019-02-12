class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances
  has_many :users, through: :attendances
 
  validates :start_date, presence: true

  validates :duration, presence: true, numericality: {greater_than: 0}

  validates :title, presence: true, length: {minimum:5, maximum:140}

  validates :description, presence: true, length: {minimum:20, maximum:1000}

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }

  validates :location, presence: true
  validate :multiple_of_5
  validate :expiration_date_cannot_be_in_the_past
 
  
  def expiration_date_cannot_be_in_the_past
    unless start_date.present? && start_date > Date.today
    end
  end

  def multiple_of_5
    unless duration.present? && duration % 5 == 0
    end
  end
  
end
