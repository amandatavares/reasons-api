class JsonWebToken
  SECRET_KEY = "f599ffa1458bafab85526307bac9bd0ca0ff1bc72d6bc865c064349aecfbc7fb69313e8666c976e618a9130ff871232dc5955ae9c58d11b38c6de546aa7e2029"
  # Rails.application.secrets.secret_key_base.to_s

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end
