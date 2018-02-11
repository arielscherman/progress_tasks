require "spec_helper"

RSpec.describe ProgressTasks::Notifier do
  let(:notifier) { ProgressTasks::Notifier.new }

  describe "#set_goal" do
    it "sets the goal" do
      goal = ProgressTasks::Goal.new(10)
      
      notifier.set_goal(goal)

      expect(notifier.goal).to eq goal
    end
  end

  describe "#started!" do
    it "raises an error because it's not defined" do
      expect{ notifier.started! }.to raise_error NotImplementedError
    end
  end

  describe "#finished!" do
    it "raises an error because it's not defined" do
      expect{ notifier.finished! }.to raise_error NotImplementedError
    end
  end

  describe "#incremented!" do
    it "raises an error because it's not defined" do
      expect{ notifier.incremented! }.to raise_error NotImplementedError
    end
  end
end