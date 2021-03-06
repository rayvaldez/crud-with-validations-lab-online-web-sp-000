class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: :artist_name,
    message: "Can not be repeated by the same artist in the same year"
  }
  validates :released, inclusion: { in: [true, false] }
  validates_presence_of :release_year, if: :released
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released
  validates :artist_name, presence: true
end
