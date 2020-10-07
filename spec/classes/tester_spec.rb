# frozen_string_literal: true

require 'pry'
require_relative '../../tester'

RSpec.describe Tester do
  let(:tester) { Tester.new }
  let(:file_path) { './spec/fixtures/0.String/' }

  it 'check length string' do
    tester.tester('0', file_path)
    tester.run_test
  end
end
