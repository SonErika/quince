class Dress < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image,
    styles: {
      medium: '700x700>'
    },
    storage: :s3,
    bucket: ENV.fetch('S3_BUCKET_NAME'),
    s3_credentials: {
      access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
    }
  validates_attachment 
    :image,
    size: {
      in: 0..20480.kilobytes,
      message: 'must be under 20MB in size.'
    },
    file_name: {
      matches: [
        /gif\Z/,
        /png\Z/,
        /jpe?g\Z/
      ],
      message:
        'needs to be one of these extensions: png, or jp(e)g.'
    }

  validates :name, presence: true
  validates :size, presence: true
  validates :price, presence: true
  SIZES = %w(US-1, US-2, US-4, US-6, US-8, US-10, US-12)
end
