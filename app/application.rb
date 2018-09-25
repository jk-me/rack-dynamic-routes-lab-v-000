#require_relative './item.rb'


class Application
  @@items =[]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      i = req.path.split('/items/').last
      a = @@items.find{|x| x.name == i}

      if a != nil
        resp.write "#{a.price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write('Route not found')
      resp.status = 404
    end
    resp.finish
  end
end
