class User < ActiveRecord::Base
  def self.find_or_create_from_auth_hash(auth_hash)
    #Buscar al usuario o crearlo
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update(
      name: auth_hash.info.name,
      profile_image: auth_hash.info.image,
      token: auth_hash.credentials.token,
      secret: auth_hash.credentials.secret,
      email: auth_hash.info.email,
      url: auth_hash.info.urls, #['info']['urls'][user.provider.capitalize],
      nickname: auth_hash.info.nickname
    )
    user
  end
end
