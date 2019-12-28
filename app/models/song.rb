class Song < ActiveRecord::Base
  # add associations here  
  
  belongs_to :artist 
  belongs_to :genre 
  
  has_many :notes 
  accepts_nested_attributes_for :artist, :notes, :genre 


  def artist_name 
    if artist 
    artist = Artist.find_by(name: artist.name )
    artist.name
    end
    
  end 

    def artist_name=(a_name)
     self.artist = Artist.find_or_create_by(name: a_name)
      
    end 


    def genre_name 
      self.genre = Genre.find_by(id: genre_id) 
      self.genre.artist_name
    end 

end
