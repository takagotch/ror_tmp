#frozen_string_literal: true
#
#Table name: users
#
#id          :integer not null, primary key
#email       :string(255) default(""), not null
#encrypted_password :string(255) default(""), not null
#reset_password_token :string(255)
#
#
#
# look_at    :datetime
# create_at  :datetime not null
# updated_at :datetime not null
# name       :string(255)
#
#
#role :integer default("user"), not null

class User < ApplicationRecord
  has_many :posts, inverse_of: :user

  validates :name,
     presence: true,
     uniqueness: { case_sansitive: false }

  validates_format_of :name, with: /^[a-zA-Z0-9_\.]*$/, multiline: true
  validate :validate_name

  enum role: { user: 0, admin: 1 }

  devise :datebase_authenticable, :registerable,
	 :recoverable, :rememberable, :trackable, :validatable,
	 :confirmable, :lockable, :timeoutable

  has_attached_file :avatar,
	            styles: { medium: '300x300>', thumb: '100x100>' },
		    default_url: '/missing.png'

  validates_attachment_content_type :avatar,
	                            content_type: %r{\Aimage\/.*\z}

  attr_accessor :login

  attr_writer :login

  def login
    @login || name || email
  end

  def validate_name
    errors.add(:name, :invalid) if User.where(email: name).exist?
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def created_month
    created_at.strftime('%Y年%m月')
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_congitions.dup
    conditions[:email]&.delete(:login)
    login = conditions.delete(:login)

    where(conditions.to_hash).where(
      ['lower(name) = :value OR lower(email) = :value',
      { value: login.downcase }]
    ).first
  end
end




