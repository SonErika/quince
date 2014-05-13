class Dress < ActiveRecord::Base
  belongs_to :user
  has_many :dress_rentals, dependent: :destroy


  validates :name, presence: true, uniqueness: true
  validates :size, presence: true
  validates :price_cents, presence: true
  monetize :price_cents
  SIZES = %w(US-1 US-2 US-4 US-6 US-8 US-10 US-12)
  
  def self.unavailable
    where(available: false)
  end

  def self.available
    where(available: true)
  end

  def make_unavailable
    update(available: false)
  end

  def make_available
    update(available: true)
  end

  def self.published
    where(published: true)
  end 

  def self.unpublished
    where(published: false)
  end

  def publish_dress
    update(published: true)
  end

  def unpublish_dress
    update(published: false)
  end

  has_attached_file :image,
    styles: {
      medium: '700x700>',
      small: '300x300>'

    },
    storage: :s3,
    bucket: ENV.fetch('S3_BUCKET_NAME'),
    s3_credentials: {
      access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
    }
  validates_attachment :image,
    size: {
      in: 0..20480.kilobytes,
      message: 'must be under 20MB in size.'
    },
    file_name: {
      matches: [
        /gif\Z/,
        /png\Z/,
        /jpe?g\Z/,
        /JPE?G\Z/
      ],
      message:
        'needs to be one of these extensions: png, or jp(e)g.'
    }

end
