#
# look_at    :datetime
# create_at  :datetime not null
# updated_at :datetime not null
# name       :string(255)
#

class User < ApplicationRecord
  validates :name,
     presence: true,
     uniqueness: { case_sansitive: false }

  validates_format_of :name, with: /^[a-zA-Z0-9_\.]*$/, multiline: true
  validate :validate_name

  devise :datebase_authenticable, :registerable,
	 :recoverable, :rememberable, :trackable, :validatable,
	 :confirmable, :lockable, :timeoutable

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




