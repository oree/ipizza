# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ipizza}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Priit Haamer"]
  s.date = %q{2010-09-19}
  s.description = %q{      Simplifies generating payment requests and parsing responses from banks when using iPizza protocol.
}
  s.email = %q{priit@fraktal.ee}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    ".gitignore",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "init.rb",
     "ipizza.gemspec",
     "lib/ipizza.rb",
     "lib/ipizza/authentication_request.rb",
     "lib/ipizza/config.rb",
     "lib/ipizza/payment.rb",
     "lib/ipizza/payment_request.rb",
     "lib/ipizza/payment_response.rb",
     "lib/ipizza/provider/nordea.rb",
     "lib/ipizza/provider/nordea/payment_request.rb",
     "lib/ipizza/provider/nordea/payment_response.rb",
     "lib/ipizza/provider/sampo.rb",
     "lib/ipizza/provider/seb.rb",
     "lib/ipizza/provider/swedbank.rb",
     "lib/ipizza/util.rb",
     "spec/certificates/bank.key",
     "spec/certificates/bank.pub",
     "spec/certificates/dealer.key",
     "spec/certificates/dealer.pub",
     "spec/config/config.yml",
     "spec/config/plain_config.yml",
     "spec/ipizza/config_spec.rb",
     "spec/ipizza/provider/nordea/payment_request_spec.rb",
     "spec/ipizza/provider/nordea/payment_response_spec.rb",
     "spec/ipizza/provider/nordea_spec.rb",
     "spec/ipizza/provider/sampo_spec.rb",
     "spec/ipizza/provider/seb_spec.rb",
     "spec/ipizza/provider/swedbank_spec.rb",
     "spec/ipizza/util_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/support/ipizza.rb"
  ]
  s.homepage = %q{http://github.com/priith/ipizza}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Implements iPizza protocol to communicate with Estonian Banks}
  s.test_files = [
    "spec/ipizza/config_spec.rb",
     "spec/ipizza/provider/nordea/payment_request_spec.rb",
     "spec/ipizza/provider/nordea/payment_response_spec.rb",
     "spec/ipizza/provider/nordea_spec.rb",
     "spec/ipizza/provider/sampo_spec.rb",
     "spec/ipizza/provider/seb_spec.rb",
     "spec/ipizza/provider/swedbank_spec.rb",
     "spec/ipizza/util_spec.rb",
     "spec/spec_helper.rb",
     "spec/support/ipizza.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
