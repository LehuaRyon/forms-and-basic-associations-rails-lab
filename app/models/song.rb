class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :genre
  belongs_to :artist

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      self.notes << Note.create(content: content)
    end
  end
  def note_info
    self.notes.map(&content)
  end
  
end
