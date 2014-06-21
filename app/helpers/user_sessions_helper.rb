module UserSessionsHelper

  def auth_path(provider)
    "/auth/#{provider}"
  end

end
