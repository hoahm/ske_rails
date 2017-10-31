class User < ApplicationRecord
  include StateEnum

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar,
    styles: { thumb: ['300x300#', :jpg] },
    convert_options: { thumb: '-quality 80 -strip' },
    path: ':rails_env/user/:attachment/:id_:created_timestamp_:style.:extension',
    url: ':rails_env/user/:attachment/:id_:created_timestamp_:style.:extension'

  validates_attachment :avatar,
    content_type: {
      content_type: %r{^image/(jpg|jpeg|pjpeg|png|x-png|gif)$}
    },
    size: { less_than: 4.megabyte }

  validates :full_name, presence: true
end
