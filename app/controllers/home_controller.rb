class HomeController < ApplicationController
  def index; end

  def result
    github_login = params["github_login"]
    query_string = "query getGitUserInfo($gitLogin: String!) {
            githubUser(name: $gitLogin) {
              name
              repos {
                name
              }}}"
    variables = { "gitLogin" => github_login }
    result_hash = Schema.execute(query_string, variables: variables)
    @result_hash = result_hash["data"]["githubUser"] unless result_hash["data"].nil?
  end
end
