module SetupNegativeCaptcha
  extend ActiveSupport::Concern

  included do
    before_action :setup_negative_captcha
  end

  def setup_negative_captcha
    @captcha = NegativeCaptcha.new(
      secret: Rails.application.secrets.captcha_secret,
      spinner: request.remote_ip,
      fields: [:name, :email, :body],
      params: params
    )
  end
end
