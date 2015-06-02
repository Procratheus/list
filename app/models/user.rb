class User < ActiveRecord::Base
  has_one :list, dependent: :destroy
end
