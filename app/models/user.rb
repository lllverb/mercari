class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  has_many :products
  has_many :purchases
  has_many :products, through: :purchases
  validates :nickname, presence: true, length: {maximum: 8}
  validates :email, presence: true
  validates :password, presence: true, length: {minimum: 7}
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/, message: 'は半角数字(10ケタor11ケタ)で入力してください'}
  validates :postal_code, presence: true, format: {with: /\A\d{7}\z/, message: 'は半角数字7ケタ(ハイフン無し)で入力してください。'}
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
  attr_accessor :current_password

  
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.create(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20],
          )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end

  private

  def self.dummy_email(auth)
    auth.info.email
  end
end
