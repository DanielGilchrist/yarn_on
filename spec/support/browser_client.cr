require "uri"

class BrowserClient < Lucky::BaseHTTPClient
  app AppServer.new

  def self.auth_exec(user : User, action : Lucky::Action.class, **params) : HTTP::Client::Response
    self.auth_exec(user, action.route, **params)
  end

  def self.auth_exec(user : User, route_helper : Lucky::RouteHelper, **params) : HTTP::Client::Response
    uri = URI.parse(route_helper.path)
    query_params = uri.query_params
    query_params.add("backdoor_user_id", user.id.to_s)
    uri.query_params = query_params

    new
      .headers("Content-Type": "text/html").@client
      .exec(
        method: route_helper.method.to_s.upcase,
        path: uri.to_s,
        body: params.to_json
      )
  end
end
