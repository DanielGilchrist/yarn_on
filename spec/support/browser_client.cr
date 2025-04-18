require "uri"

class BrowserClient < Lucky::BaseHTTPClient
  app AppServer.new

  def self.exec(user : User, action : Lucky::Action.class)
    exec(user, action.route)
  end

  def self.exec(user : User, action : Lucky::Action.class, **params)
    exec(user, action.route, **params)
  end

  def self.exec(user : User, route_helper : Lucky::RouteHelper, body : String? = nil)
    uri = URI.parse(route_helper.path)
    query_params = uri.query_params
    query_params.add("backdoor_user_id", user.id.to_s)
    uri.query_params = query_params

    new
      .headers("Content-Type": "text/html")
      .@client
      .exec(method: route_helper.method.to_s.upcase, path: uri.to_s, body: body)
  end

  def self.exec(user : User, route_helper : Lucky::RouteHelper, **params)
    transformed_params = {} of String => String

    params.each do |key, value|
      if value.is_a?(NamedTuple)
        value.each do |nested_key, nested_value|
          transformed_params["#{key}:#{nested_key}"] = nested_value.to_s
        end
      else
        transformed_params[key.to_s] = value.to_s
      end
    end

    body = URI::Params.encode(transformed_params)

    exec(user, route_helper, body)
  end
end
