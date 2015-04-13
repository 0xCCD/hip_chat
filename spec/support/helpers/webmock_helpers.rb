require 'webmock/rspec'

module WebmockHelpers
  HEADERS = {'Accept' => '*/*', 'User-Agent' => 'Ruby'}

  def stub_unauthorized_access(token)
    stub_request(:get, HipChat::User::URL).
      with(headers: HEADERS, query: {auth_token: token}).
        to_return({
          status: 401,
          body: {error: {code: 401, message: "Unauthorize", type: "Unauthorized"}}.to_json
        })
  end

  def stub_authorized_access(token)
    stub_request(:get, HipChat::User::URL).
      with(headers: HEADERS, query: {auth_token: token}).
        to_return({
          status: 200,
          body: {
            items: (1..5).map do |i|
              {
                id: i,
                links: {self: "https://api.hipchat.com/v2/user/#{i}"},
                mention_name: "MentionName#{i}",
                name: "Full Name #{i}"
              }
             end
          }.to_json
        })
  end

end
