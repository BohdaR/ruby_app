require 'rails_helper'
require 'net/http'

RSpec.describe Types::QueryType do
  before(:each) do
    query_string = <<-GRAPHQL
          query getGitUserInfo($gitLogin: String!) {
            githubUser(name: $gitLogin) {
              name
              repos {
                name
              }
            }
          }
    GRAPHQL

    @name = 'dhh'
    @result = Schema.execute(query_string, variables: { 'gitLogin' => @name })['data']['githubUser']
    @res_by_user_info = Net::HTTP.get_response(URI("https://api.github.com/users/#{@name}"))
    @res_by_user_repos = Net::HTTP.get_response(URI("https://api.github.com/users/#{@name}/repos"))
  end

  it describe 'loads information about GitHub user' do
    assert_equal JSON.parse(@res_by_user_info.body)['name'], @result['name']
  end

  it describe 'check github repos length' do
    assert_equal JSON.parse(@res_by_user_repos.body).length, @result['repos'].length
  end

  it describe 'check github repos names' do
    (0..@result['repos'].length - 1).each do |i|
      assert_equal JSON.parse(@res_by_user_repos.body)[i]['name'], @result['repos'][i]['name']
    end
  end
end
