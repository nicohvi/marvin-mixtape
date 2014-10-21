class Artist < ActiveRecord::Base
  # Associations
  belongs_to :mixtape
  
  # Validations
  validates_presence_of :spotify_id, :name

end
