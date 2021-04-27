class RouteSet
  def initialize(attribute)
    # Minimal version, for real produciton ready we version we may have to use ordered list
    @routes = {}
  end

  def draw(&block)
  end
end

class RouteMapper
  def initialize(rotue_set)
    @rotue_set = rotue_set
  end
end

class Rails
  def self.routes
    @routes ||= RouteSet.new
  end
end
