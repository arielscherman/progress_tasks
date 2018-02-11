require "spec_helper"
require "support/a_task"

class CustomTask < ProgressTasks::Task
  def initialize(ids)
    @ids = ids
    super()
  end

  def items
    @ids
  end

  def process_item(item)
  end
end

RSpec.describe CustomTask do
  it_behaves_like "a task" do
    let(:task) { CustomTask.new([1, 2, 3]) }
  end
end