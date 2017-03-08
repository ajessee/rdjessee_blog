class Story < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  mount_uploader :thumbnail, PictureUploader

  @@age_array = []
  @@year_array = []
  @@decade_array = []

  def self.get_metadata
    Story.find_each do |story|
      @@age_array.push(story.age)
      @@year_array.push(story.year_written)
      @@decade_array.push(story.decade)
    end
  end

  def self.three_random_stories(page)
    Story.all.order(title: :asc).paginate(:page => page, :per_page => 3)
  end

  def self.order_by_year(year, page)
    Story.where(year_written: year.to_i).paginate(:page => page, :per_page => 3)
  end

  def self.order_by_age(age, page)
    Story.where(age: age.to_i).paginate(:page => page, :per_page => 3)
  end

  def self.order_by_decade(decade, page)
    Story.where(decade: decade.to_i).paginate(:page => page, :per_page => 3)
  end

  def self.all_ages
    @@age_array.sort.uniq!
  end

  def self.all_years
    @@year_array.sort.uniq!
  end

  def self.all_decades
    @@decade_array.sort.uniq!
  end

end
