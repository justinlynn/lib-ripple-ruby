require 'spec/unit/helper'

describe Rippler::Protocol::Message::DomainSpecificLanguage::Fields do

  context 'class methods' do

    subject{Rippler::Protocol::Message::DomainSpecificLanguage::Fields::ClassMethods}

    it 'defines the has_field attribute declaration' do
      subject.instance_methods.should include(:has_field)
    end

    it 'defines an accessor for all fields' do
      subject.instance_methods.should include(:fields)
    end

  end

  context 'attribute accessors' do

    field_names = [:test_field_one, :test_field_two]

    test_class = Class.new(Rippler::Protocol::Message) do
      field_names.each do |field|
        has_field field
      end
    end

    subject do
      test_class.new
    end

    it 'defines an accessor for all fields' do
      subject.should respond_to(:fields)
    end

    context 'accessor for fields' do

      subject do
        test_class.new.fields
      end

      it 'returns an array of fields' do
        subject.should be_a_kind_of(Array)
      end

      context 'that array of fields' do

        it 'contains only named test fields' do
          subject.count.should be(field_names.count)
          field_names.each do |field_name|
            subject.map(&:name).should include(field_name)
          end
        end

      end

    end

  end

end