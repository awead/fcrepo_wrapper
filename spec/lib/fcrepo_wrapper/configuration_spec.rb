require 'spec_helper'

describe FcrepoWrapper::Configuration do
  let(:config) { described_class.new options }

  describe "#port" do
    subject { config.port }

    context "when port is set to nil" do
      let(:options) { { port: nil } }
      it { is_expected.to eq nil }
    end

    context "when port is not set" do
      let(:options) { {} }
      it { is_expected.to eq '8080' }
    end

    context "when a port is provided" do
      let(:options) { { port: '8888' } }
      it { is_expected.to eq '8888' }
    end
  end

  describe "#read_config" do
    before do
      allow(config).to receive(:default_configuration_paths).and_return([])
    end
    let(:options) { { config: 'spec/fixtures/sample_config.yml' } }

    it "uses values from the config file" do
      expect(config.version_file).to eq 'path/to/VERSION'
    end
    it "evalates yaml true values as ruby booleans" do
      expect(config.validate).to be true
    end
    it "evaluates yaml false values as ruby booleans" do
      expect(config.verbose?).to be false
    end
    it "doesn't cast numerics to strings" do
      expect(config.port).to eq 9999
    end

  end

  describe "#validate" do
    let(:options) { {} }
    subject { config.validate }
    it { is_expected.to eq true }
  end

  describe "#md5sum" do
    let(:options) { {} }
    subject { config.md5sum }
    it { is_expected.to be nil }
  end

  describe "#ignore_md5sum" do
    let(:options) { {} }
    subject { config.ignore_md5sum }
    it { is_expected.to be false }
  end
end
