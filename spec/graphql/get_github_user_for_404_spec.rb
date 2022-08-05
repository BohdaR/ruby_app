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

    @name = 'some_incorrect_name'
    @result = Schema.execute(query_string, variables: { 'gitLogin' => @name })['data']['githubUser']
  end

  it describe '404 or 403' do
    assert_nil @result
  end
end
