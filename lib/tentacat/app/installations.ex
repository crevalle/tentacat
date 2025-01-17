defmodule Tentacat.App.Installations do
  import Tentacat
  alias Tentacat.Client

  @doc """
  List installations for the authorized app.

  ## Example

      Tentacat.App.Installations.list_mine client

  More info at: https://developer.github.com/v3/apps/#find-installations
  """
  @spec list_mine(Client.t()) :: Tentacat.response()
  def list_mine(client) do
    get("app/installations", client)
  end

  @doc """
  List installations accessible with the authenticated app user.

  ## Example

      Tentacat.App.Installations.list_for_user client

  More info at: https://developer.github.com/v3/apps/#list-installations-for-user
  """
  @spec list_for_user(Client.t()) :: Tentacat.response()
  def list_for_user(client) do
    get("user/installations", client)
  end

  @doc """
  Get a specific installation.

  ## Example

      Tentacat.App.Installations.find client, 12

  More info at: https://developer.github.com/v3/apps/#get-a-single-installation
  """
  @spec find(Client.t(), integer) :: Tentacat.response()
  def find(client, installation_id) do
    get("app/installations/#{installation_id}", client)
  end

  @doc """
  Get an authorization token for an installation.

  ## Example

      Tentacat.App.Installations.token client, 12

  More info at: https://developer.github.com/v3/apps/#create-a-new-installation-token
  """
  @spec token(Client.t(), integer) :: Tentacat.response()
  def token(client, installation_id) do
    post("app/installations/#{installation_id}/access_tokens", client)
  end

  @doc """
  List repositories for the authenticated installation.

  ## Example

      Tentacat.App.Installations.list_repositories

  More info at: https://developer.github.com/v3/apps/installations/#list-repositories
  """
  @spec list_repositories(Client.t()) :: Tentacat.response()
  def list_repositories(client) do
    get("installation/repositories", client)
  end

  @doc """
  List repositories in an installation that are accessible with to the
  authenticated app user.

  ## Example

      Tentacat.App.Installations.list_repositories_for_user client, 154

  More info at: https://developer.github.com/v3/apps/#list-installations-for-user
  """
  @spec list_repositories_for_user(Client.t(), integer) :: Tentacat.response()
  def list_repositories_for_user(client, installation_id) do
    get("user/installations/#{installation_id}/repositories", client)
  end

  @doc """
  Suspends the app on the given installation.  Requires a JWT.

  ## Example

      Tentacat.App.Installations.suspend client, 154

  More info at: https://docs.github.com/en/rest/apps/apps?apiVersion=2022-11-28#suspend-an-app-installation
  """
  @spec suspend(Client.t(), integer) :: Tentacat.response()
  def suspend(client, installation_id) do
    put("app/installations/#{installation_id}/suspended", client, nil)
  end

  @doc """
  Unsuspends the app on the given installation.  Requires a JWT.

  ## Example

      Tentacat.App.Installations.unsuspend client, 154

  More info at: https://docs.github.com/en/rest/apps/apps?apiVersion=2022-11-28#unsuspend-an-app-installation
  """
  @spec unsuspend(Client.t(), integer) :: Tentacat.response()
  def unsuspend(client, installation_id) do
    delete("app/installations/#{installation_id}/suspended", client, nil)
  end

  @doc """
  Uninstalls the app on the given installation.  Requires a JWT.

  ## Example

      Tentacat.App.Installations.uninstall client, 154

  More info at: https://docs.github.com/en/rest/apps/apps?apiVersion=2022-11-28#delete-an-installation-for-the-authenticated-app
  """
  @spec uninstall(Client.t(), integer) :: Tentacat.response()
  def uninstall(client, installation_id) do
    delete("app/installations/#{installation_id}", client, nil)
  end

end
