class Mixtape < ActiveRecord::Base
  after_initialize :generate_slug

  def self.find(slug)
    self.find_by_slug(slug)
  end

  def to_param
    self.slug
  end  
  
  private

  def generate_slug
    self.slug = SecureRandom.hex(5)
  end

end
