module ApplicationHelper
  def auth_for(provider)
    "/auth/#{provider}"
  end
end
