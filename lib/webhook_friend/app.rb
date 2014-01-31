require "sinatra/base"
require "yajl"
require "yajl/json_gem"
require "pusher"

module WebhookFriend
  class App < Sinatra::Base
    set :views, "#{settings.root}/../../views"

    get '/' do
      erb :index
    end

    post '/endpoint' do
      Pusher['messages'].trigger('post', { message: json_body.to_json, ip: request.ip })
      204
    end

    def json_body
      @env["rack.request.json_body"]
    end
  end
end
