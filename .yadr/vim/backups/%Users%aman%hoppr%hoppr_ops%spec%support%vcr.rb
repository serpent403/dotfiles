Vim�UnDo� ��6��~2m����gPt`�Uw���'K�F                                      R`T;    _�                             ����                                                                                                                                                                                                                                                                                                                                                             R_ל    �                   5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             R`T:     �                  class VCR::Cassette     def sanitized_name   .    name.to_s.gsub(/[^\w\-\/]+/, '_').downcase     end   end       RSpec.configure do |c|   :  c.treat_symbols_as_metadata_keys_with_true_values = true   end       VCR.configure do |config|   4  config.cassette_library_dir     = 'spec/cassettes'   <  config.default_cassette_options = { record: :new_episodes}   "  config.configure_rspec_metadata!     config.hook_into :webmock   end5��