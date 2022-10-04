# frozen_string_literal: true

module Types
  class GithubUserType < Types::BaseObject
    field :name, String
    field :repos, [Types::RepoType]
  end
end
