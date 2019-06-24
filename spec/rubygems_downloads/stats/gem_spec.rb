# frozen_string_literal: true

RSpec.describe RubygemsDownloads::Stats::Gem do
  # shameless plug
  let(:gem_name) { 'callable_class' }
  let(:invalid_gem_name) { 'aaaaabbbbbcccccdddddeeeee' }
  let(:valid_instance) { described_class.new(gem_name) }
  let(:invalid_instance) { described_class.new(nil) }

  context 'when calling class methods' do
    it { expect(described_class).to respond_to(:call) }
  end

  context 'with valid attributes' do
    it { expect(valid_instance).to respond_to(:name) }

    it { expect(valid_instance).to have_attributes(name: gem_name) }
  end

  context 'with invalid attributes' do
    it { expect { invalid_instance }.to raise_error(ArgumentError, /`name` parameter invalid/) }
  end

  context 'when retrieving stats' do
    context 'when using class method .call' do
      it { expect(valid_instance).to respond_to(:call) }

      it { expect(described_class.call(gem_name)).to be_kind_of(RubygemsDownloads::Gem) }
    end

    context 'when using instance method #call' do
      it { expect(valid_instance).to respond_to(:call) }

      it { expect(valid_instance.call).to be_kind_of(RubygemsDownloads::Gem) }
    end

    it 'results match when using either class or instance methods' do
      expect(valid_instance.call).to eq(described_class.call(gem_name))
    end
  end

  context 'with non-existing gem name' do
    it { expect(described_class.call(invalid_gem_name)).to be_nil }
  end

  context 'when trying to call protected methods' do
    it { expect { valid_instance.endpoint }.to raise_error(NoMethodError, /protected method/) }
    it { expect { valid_instance.placeholder }.to raise_error(NoMethodError, /protected method/) }
    it { expect { valid_instance.url }.to raise_error(NoMethodError, /protected method/) }
  end
end
