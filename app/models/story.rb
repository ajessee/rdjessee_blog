class Story < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :pictures, as: :imageable
  has_many :comments, as: :commentable
  has_many :recordings, as: :recordable
  has_many :videos, as: :videoable
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :year_written, numericality: { only_integer: true }
  validates :decade, numericality: { only_integer: true }
  validates :age, numericality: { only_integer: true }
  accepts_nested_attributes_for :videos, :allow_destroy => true
  accepts_nested_attributes_for :recordings, :allow_destroy => true
  accepts_nested_attributes_for :pictures, :allow_destroy => true
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

  def self.get_stories(page)
    Story.all.order(title: :asc).paginate(:page => page, :per_page => 6)
  end

  def self.order_by_year(year, page)
    Story.where(year_written: year.to_i).paginate(:page => page, :per_page => 6)
  end

  def self.order_by_age(age, page)
    Story.where(age: age.to_i).paginate(:page => page, :per_page => 6)
  end

  def self.order_by_decade(decade, page)
    Story.where(decade: decade.to_i).paginate(:page => page, :per_page => 6)
  end

  def self.order_by_tag(tag, page)
    Tag.find_by_name!(tag.strip).stories.paginate(:page => page, :per_page => 6)
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

  def strip_divs
    if self.content[0..4] == "<div>" && self.content[-6..-1] == "</div>"
      self.content = self.content[5..-7]
    end
    if self.title[0..4] == "<div>" && self.title[-6..-1] == "</div>"
      self.title = self.title[5..-7]
    end
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end


end
