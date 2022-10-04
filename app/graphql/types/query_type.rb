# frozen_string_literal: true

require "net/http"
require "json"
module Types
  class QueryType < GraphQL::Schema::Object
    description "The query root of this schema"

    # First describe the field signature:
    field :github_user, Types::GithubUserType, "Find github repos name by github login" do
      argument :name, String
    end

    def github_user(name:)
      res_by_user_info = Net::HTTP.get_response(URI("https://api.github.com/users/#{name}"))
      res_by_user_repos = Net::HTTP.get_response(URI("https://api.github.com/users/#{name}/repos"))

      return unless (res_by_user_info.code == "200") && (res_by_user_repos.code == "200")

      result = JSON.parse(res_by_user_info.body)
      result["repos"] = JSON.parse(res_by_user_repos.body)

      result
    end
  end
end
