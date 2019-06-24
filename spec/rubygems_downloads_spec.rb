# frozen_string_literal: true

RSpec.describe RubygemsDownloads do
  let(:author_name) { 'laurentzziu' }
  let(:gem_name) { 'to_human' }
  let(:gem_class) { RubygemsDownloads::Stats::Gem }
  let(:author_class) { RubygemsDownloads::Stats::Author }

  it 'has a version number' do
    expect(RubygemsDownloads::VERSION).not_to be(nil)
  end

  context 'when calling wrapper methods' do
    context 'when calling .for_gem' do
      it { expect(described_class).to respond_to(:for_gem).with(1).argument }

      it 'matches the result of the wrapped called class' do
        expect(described_class.for_gem(gem_name)).to eq(gem_class.call(gem_name))
      end
    end

    context 'when calling .for_author' do
      it { expect(described_class).to respond_to(:for_author).with(1).argument }

      it 'matches the result of the wrapped called class' do
        expect(described_class.for_author(author_name)).to eq(author_class.call(author_name))
      end
    end
  end
end
