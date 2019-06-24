# frozen_string_literal: true

RSpec.describe RubygemsDownloads::Stats::Author do
  # shameless plug
  let(:author_name) { 'laurentzziu' }
  let(:invalid_author_name) { 'aaaaabbbbbcccccdddddeeeee' }
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

  context 'when retrieving stats' do
    context 'when using class method .call' do
      it { expect(valid_instance).to respond_to(:call) }

      it { expect(described_class.call(author_name)).to be_kind_of(Array) }

      it 'contains elements of class `RubygemsDownloads::Gem`' do
        expect(described_class.call(author_name).map(&:class).uniq).to match_array([RubygemsDownloads::Gem])
      end
    end

    context 'when using instance method #call' do
      it { expect(valid_instance).to respond_to(:call) }

      it { expect(valid_instance.call).to be_kind_of(Array) }

      it 'contains elements of class `RubygemsDownloads::Gem`' do
        expect(valid_instance.call.map(&:class).uniq).to match_array([RubygemsDownloads::Gem])
      end
    end

    it 'results match when using either class or instance methods' do
      expect(valid_instance.call).to eq(described_class.call(author_name))
    end
  end

  context 'with non-existing author name' do
    it { expect(described_class.call(invalid_author_name)).to match_array([]) }
  end

  context 'when trying to call protected methods' do
    it { expect { valid_instance.endpoint }.to raise_error(NoMethodError, /protected method/) }
    it { expect { valid_instance.placeholder }.to raise_error(NoMethodError, /protected method/) }
    it { expect { valid_instance.url }.to raise_error(NoMethodError, /protected method/) }
  end
end
