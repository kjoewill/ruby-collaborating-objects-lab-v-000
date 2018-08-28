class MP3Importer
  
  attr_accessor :path, :files
  
  def initialize(path)
    @path = path
    full_path = self.path + "/*.mp3"
    filenames_with_path = Dir[full_path]
    @files = filenames_with_path
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
    name
  end

end

puts "Starting import"
#MP3Importer.new("./db/mp3s").import
importer = MP3Importer.new("./spec/fixtures/mp3s")
puts importer.files.size
puts importer.files