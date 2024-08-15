# frozen_string_literal: true

require 'spec_helper'

# rubocop:disable RSpec/RepeatedExample
describe 'openldap::server::service' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'with no parameters' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('openldap::server::service') }

        case facts[:os]['family']
        when 'Debian'
          it {
            is_expected.to contain_service('slapd').with(ensure: :running,
                                                         enable: true)
          }
        when 'RedHat'
          case facts[:operatingsystemmajrelease]
          when '5'
            it {
              is_expected.to contain_service('ldap').with(ensure: :running,
                                                          enable: true)
            }
          else
            it {
              is_expected.to contain_service('slapd').with(ensure: :running,
                                                           enable: true)
            }
          end
        end
      end
    end
  end
end
# rubocop:enable RSpec/RepeatedExample
