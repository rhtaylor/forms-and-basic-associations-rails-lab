class Song < ActiveRecord::Base
  # add associations here  
  
  belongs_to :artist 
  belongs_to :genre 
  
  has_many :notes 
 # accepts_nested_attributes_for :artist, :notes, :genre 


  def artist_name 

    if self.artist_id
    artist = Artist.find_by(id: self.artist_id )
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

    def note_contents=(contents)
        contents.each do |content|  
            if !(content.empty?)
            self.notes.new(content: content) 
            end
        end
    end

    def note_contents 
        self.notes.map{ |note| note.content }
    end
end
