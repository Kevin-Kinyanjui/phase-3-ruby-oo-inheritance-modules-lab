require_relative './concerns/memorable'
require_relative './concerns/paramable'

class Song
  attr_accessor :name
  attr_reader :artist

  @@songs = []

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  include Paramable

  def self.all
    @@songs
  end

  def add_artist(artist)
    @artist = artist
  end

  def artist=(artist)
    @artist = artist
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end
end
