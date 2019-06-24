# frozen_string_literal: true

RSpec.describe RubygemsDownloads::Stats::Base do
  # shameless plug
  let(:author_name) { 'laurentzziu' }
  let(:valid_instance) { described_class.new(author_name) }
  let(:invalid_instance) { described_class.new(nil) }

  context 'when calling class methods' do
    it { expect(described_class).to respond_to(:call) }
  end

  context 'with valid attributes' do
    it { expect(valid_instance).to respond_to(:name) }

    it { expect(valid_instance).to have_attributes(name: author_name) }
  end

  context 'with invalid attributes' do
    it { expect { invalid_instance }.to raise_error(ArgumentError, /`name` parameter invalid/) }
  end

  context 'when trying to call protected methods' do
    it { expect { valid_instance.url }.to raise_error(NoMethodError, /protected method/) }
  end
end
