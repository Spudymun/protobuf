# frozen_string_literal: true

require "config/app"

# rubocop:disable all
def json_request(path = "/", params = {}, session_key = nil)
  headers = params.delete(:headers)

  path, query_string = split_query_string(path) if path.include?("?")

  env = { "REQUEST_METHOD" => params.delete(:method) || "POST",
          "PATH_INFO" => path,
          "QUERY_STRING" => query_string,
          "SCRIPT_NAME" => "",
          "CONTENT_TYPE" => params.delete(:content_type) || "application/json",
          "SERVER_NAME" => "example.com",
          "rack.input" => StringIO.new((params.delete(:body) || {}).to_json),
          "rack.errors" => $stderr }

  env["HTTP_SESSION"] = session_key || "session"
  env["rack.input"].rewind
  env.merge!(headers) if headers

  r = EmployeeDetailsApp.call(env)
  r[2] = r[2].first
  r
end

def split_query_string(path)
  path_split = path.split("?")
  [path_split[0], path_split[1]] #=> ["/path", "per=10&page=1"]
end

# rubocop:enable all
