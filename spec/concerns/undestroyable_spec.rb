require 'spec_helper'

shared_examples_for "undestroyable" do
  let(:model) { described_class }

  it "prevent to destroy the record" do
    record = FactoryBot.create(model.to_s.underscore.to_sym)
    expect { record.destroy! }.to raise_error(ActiveRecord::RecordNotDestroyed)
  end
end
