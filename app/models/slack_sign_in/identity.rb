class SlackSignIn::Identity
  def initialize(params)
    @params = JSON.parse(params)
  end

  def unique_id
    "#{team_id}-#{user_id}"
  end

  def team_id
    params["team_id"]
  end

  def user_id
    params["user_id"]
  end

  def name
    params.dig("user", "name")
  end

  def email
    params.dig("user", "email")
  end

  def avatar(size: 48)
    params.dig("user", "image_#{size}")
  end

  private

  attr_reader :params
end
