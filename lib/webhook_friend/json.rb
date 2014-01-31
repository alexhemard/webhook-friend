require "yajl"

module WebhookFriend
  class JSON < Struct.new(:app)
    def error status, thing, extras = nil
      [status,
       { "Content-Type" => "application/json;charset=utf-8" },
       [Yajl::Encoder.encode((extras || {}).merge errors: thing)]]
    end

    def call env
      unless (body = env["rack.input"].read).empty?
        if env["CONTENT_TYPE"] =~ /\Aapplication\/json/
          begin
            env["rack.request.json_body"] = Yajl::Parser.parse(body)
          rescue Yajl::ParseError
            return error 400, request: ["Malformed syntax."]
          end
        end
      end
      app.call env
    end
  end
end
