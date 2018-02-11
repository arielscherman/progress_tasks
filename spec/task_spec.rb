require "spec_helper"

RSpec.describe ProgressTasks::Task do
  let(:task) { ProgressTasks::Task.new }

  describe "initialize" do
    it "defaults to NullNotifier" do
      expect(task.notifier).to be_a ProgressTasks::NullNotifier
    end
  end

  describe "#items" do
    it "has a required implementation" do
      expect{ task.items }.to raise_error NotImplementedError
    end
  end

  describe "#process_item" do
    it "has a required implementation" do
      expect{ task.process_item(nil) }.to raise_error NotImplementedError
    end
  end
end