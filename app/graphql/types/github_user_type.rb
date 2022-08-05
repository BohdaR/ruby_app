module Types
  class GithubUserType < Types::BaseObject
    field :name, String
    field :repos, [Types::RepoType]
  end
end
