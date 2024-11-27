require "kemal"

module Pixitar
  class Web
    def self.run
      get "/avatar/:gender" do |env|
        gender = env.params.url["gender"]
        avatar = Avatar.new

        begin
          path = avatar.generate_avatar(gender.to_sym)
          env.response.content_type = "image/png"
          send_file env, path
        rescue InvalidGenderError
          env.response.status_code = 400
          "Invalid gender specified. Use 'male' or 'female'"
        end
      end

      Kemal.run
    end
  end
end
