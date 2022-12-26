defmodule Tentacat.CheckSuites do
  import Tentacat
  alias Tentacat.Client

  @doc """
  List check suites for a git ref

  ## Example

      Tentacat.Commits.list(client, "elixir-lang", "elixir", "b104fa")

  More info at:
  https://docs.github.com/en/rest/checks/suites?apiVersion=2022-11-28#list-check-suites-for-a-git-reference
  """
  @spec list_for_ref(Client.t(), binary, binary, binary) :: Tentacat.response()
  def list_for_ref(client \\ %Client{}, owner, repo, ref) do
    get("repos/#{owner}/#{repo}/commits/#{ref}/check-suites", client)
  end
end
