require "spec_helper"

RSpec.describe ProgressTasks::Goal do
  let(:goal) { ProgressTasks::Goal.new(100) }

  describe "initialize" do
    it "assignes values" do
      goal = ProgressTasks::Goal.new(100, label: "Processing Foo")

      expect(goal.number).to   eq 100
      expect(goal.progress).to eq 0
      expect(goal.label).to    eq "Processing Foo"
    end

    describe "default values" do
      it "assignes defualt values for optional params" do
        expect(goal.label).to eq "Task"
      end
    end

    context "when goal is 0" do
      it "starts as completed" do
        goal = ProgressTasks::Goal.new(0)
        expect(goal.completed?).to be_truthy
      end
    end

    context "when goal is greater than 0" do
      it "starts as not completed" do
        expect(goal.completed?).to be_falsey
      end
    end
  end

  describe "#increment!" do
    context "when a number is not given" do
      it "adds +1 to the progress" do
        expect { goal.increment! }.to change { goal.progress }.from(0).to(1)
      end
    end

    context "when a number is given" do
      it "adds that given number to the progress" do
        expect { goal.increment!(50) }.to change { goal.progress }.from(0).to(50)
      end
    end
  end

  describe "#completed?" do
    context "when progress is lower than goal" do
      before { goal.increment!(25) }

      it "is not completed" do
        expect(goal.completed?).to be_falsey
      end
    end

    context "when progress is same as goal" do
      before { goal.increment!(goal.number) }

      it "is completed" do
        expect(goal.completed?).to be_truthy
      end
    end
  end
end
