class MP3Importer
  
  attr_accessor :path, :files
  
  def initialize(path)
    @path = path
    @files = []
  end

  def files
    @files
  end

  def import 
    full_path = self.path + "/*.mp3"
    file_names = Dir[full_path]
    puts file_names.inspect
    short_names = file_names.collect { |e| short_name(e) }
    #short_names.each { |e| Song.new_by_filename(e) }
  end
 
  private
  
  def short_name (name)
    name.sub!("./db/mp3s/", "")
    #name.sub!(".mp3", "")
    name
  end

end

puts "Starting import"
#MP3Importer.new("./db/mp3s").import
MP3Importer.new("./spec/fixtures/mp3s").import