require 'spec_helper'

describe TransactionsHelper do
  describe 'signed_amount' do
    let(:amount) { rand(1..10_000) }
    subject { OpenStruct.new(amount: amount) }

    it 'return value with `+` if kind is income' do
      subject.kind = :income

      signed_amount(subject).should == "+#{amount}"
    end

    it 'return value with `-` if kind is outcome' do
      subject.kind = :outcome

      signed_amount(subject).should == "-#{amount}"
    end
  end

  describe 'kind_label' do
    let(:transaction) { OpenStruct.new }

    it 'return "success" if kind is income' do
      transaction.kind = :income

      kind_label(transaction).should == "success"
    end

    it 'return "error" if kind is outcome' do
      transaction.kind = :outcome

      kind_label(transaction).should == "error"
    end
  end
end
