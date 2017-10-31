module UserHelper
  def user_avatar(user)
    avatar_url = user.avatar.file? ? user.avatar.url(:thumb) : 'avatar-1.jpg'

    image_tag avatar_url, alt: 'Avatar', class: 'img-fluid rounded-circle'
  end
end
