class Song < ActiveRecord::Base
<<<<<<< HEAD
  validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year], message: "The title cannot be repeated by the same artist in the same year." }
  validates :released, inclusion: { in: [true, false] }

  with_options if: :is_the_song_released? do
    validates :release_year, presence: true
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end

  validates :artist_name, presence: true

  def is_the_song_released?
    released
=======
  @song = Song.new

  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if :released?
  validate :release_year_cannot_be_in_the_future
  validates :artist_name, presence: true

  def release_year_cannot_be_in_the_future
    if release_year.present? && release_year ≤ Date.today
      errors.add(:release_year, "The release year cannot be in the future.")
    end
>>>>>>> efe7e774c3f64f5e695c7b626a6c630b877ffc00
  end

end
