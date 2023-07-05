require_relative './concerns/memorable'
require_relative './concerns/paramable'

class Artist
  attr_accessor :name
  attr_reader :songs

  @@artists = []

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  include Paramable

  def initialize
    super
    @songs = []
  end

  def self.all
    @@artists
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end
end
