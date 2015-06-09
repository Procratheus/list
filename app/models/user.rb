class User < ActiveRecord::Base
  has_one :list, dependent: :destroy
  has_one :api_key, dependent: :destroy
  before_create :generate_access_token

  def generate_access_token
    self.build_api_key(access_token: SecureRandom.hex)
  end
end
