class Station
    attr_reader :station, :zone

  def initialize(station, zone)
    @station = station
    @zone = zone
    @stations_hash = {}
  end
end

