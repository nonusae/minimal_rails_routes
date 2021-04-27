class RouteSet
  def initialize
    # Minimal version, for real produciton ready we version we may have to use ordered list
    @routes = {}
  end

  def draw(&block)
    mapper = RouteMapper.new(self)
    mapper.instance_eval(&block)
  end

  def add_route(type, path)
    @routes[path] = {
      type: type
    }
  end
end

class RouteMapper
  def initialize(route_set)
    @route_set = route_set
  end

  def get(name)
    @route_set.add_route("GET", name)
  end

  def post(name)
    @route_set.add_route("POST", name)
  end

  def delete(name)
    @route_set.add_route("DELETE", name)
  end
end

class Rails
  def self.routes
    @routes ||= RouteSet.new
  end
end


# Testing

Rails.routes.draw do
  get :about
  post :user
  delete :post

  p self
end
