class AuthToken
  attr_reader :payload, :secret_word, :token

  def initialize(args)
    @secret_word = 'donutsaredelicious'

    if args.key?(:user)
      @payload = args[:user]
    elsif args.key?(:token)
      @token = args[:token]
    end
  end

  def encode
    JWT.encode(payload, secret_word, 'HS256')
  end

  def decode
    JWT.decode(token, secret_word, true, { algorithm: 'HS256' })
  end

end
