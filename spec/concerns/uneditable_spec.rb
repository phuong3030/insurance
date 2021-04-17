require 'spec_helper'

shared_examples_for "uneditable" do
  let(:model) { described_class }

  it "prevent to edit the record" do
    record = FactoryBot.create(model.to_s.underscore.to_sym)
    record.updated_at = DateTime.now
    expect { record.save }.to raise_error(ActiveRecord::ReadOnlyRecord)
  end
end
