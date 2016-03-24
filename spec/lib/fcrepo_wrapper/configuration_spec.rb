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
      expect(config.port).to eq '9999'
    end

  end
end

