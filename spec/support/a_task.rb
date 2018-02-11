RSpec.shared_examples "a task" do

  describe "notifier" do
    it "has a notifier" do
      if task.notifier.is_a?(ProgressTasks::NullNotifier)
        RSpec.warning("You haven't specified a notifier, so you're using a NullNotifier which isn't broadcasting the progress.")
      end

      expect(task.notifier).to be_a ProgressTasks::Notifier
    end
  end

  describe "#perform!" do
    it "tells the notifier the processing steps and increment progress on goal" do
      expect(task.notifier).to receive(:set_goal).with(task.goal)
      expect(task.notifier).to receive(:started!)
      expect(task.goal).to receive(:increment!).exactly(task.items.count).times
      expect(task.notifier).to receive(:incremented!).exactly(task.items.count).times
      expect(task.notifier).to receive(:finished!)

      task.perform!
    end
  end

  describe "#perform" do
    it "process each item" do
      expect(task).to receive(:process_item).exactly(task.items.count).times
      task.perform
    end

    it "calls the block once for each item" do
      expect { |block| task.perform(&block) }.to yield_control.exactly(task.items.count).times
    end
  end

  describe "#goal" do
    it "returns a Goal" do
      expect(task.goal).to be_a ProgressTasks::Goal
    end
  end

  describe "#items" do
    it "does not raise an error" do
      expect{ task.items }.to_not raise_error
    end
  end

  describe "#process_item" do
    it "does not raise an error" do
      expect{ task.process_item(task.items.first) }.to_not raise_error
    end
  end

  describe "#completed_on" do
    it "returns the items count" do
      expect(task.completed_on).to eq task.items.count
    end
  end

  describe "#label" do
    it "does not raise an error" do
      expect{ task.label }.to_not raise_error
    end
  end
end