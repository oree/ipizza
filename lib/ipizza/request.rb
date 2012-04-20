module Ipizza
  class Request
    
    attr_accessor :extra_params
    attr_accessor :sign_params
    attr_accessor :service_url
    
    def sign(privkey_path, privkey_secret, order, mac_param = 'VK_MAC')
      # Count characters or bytes? Swedbank wants characters.
      count_characters_instead_of_bytes = self.extra_params.key?('VK_ENCODING')
      hash = Ipizza::Util.mac_data_string(sign_params, order, count_characters_instead_of_bytes)
      signature = Ipizza::Util.sign(privkey_path, privkey_secret, hash)
      self.sign_params[mac_param] = signature
      self.extra_params['_hash'] = hash
    end
    
    def request_params
      sign_params.merge(extra_params)
    end
  end
end