require_relative '../task_2_for_tests'
describe Task_2_class_for_tests do
  it "should match for bugs bunny" do
    expect(Task_2_class_for_tests.new.add_bunnies(1, "bugs bunny")).to include("bugs" => "bunny")
  end
  it "should match for nil" do
    expect(Task_2_class_for_tests.new.add_bunnies(1, "")).to include(nil => nil)
  end
  it "should match for bugs" do
    expect(Task_2_class_for_tests.new.add_bunnies(1, "bugs")).to include(nil => nil)
  end
  it "should match for count=0" do
    expect(Task_2_class_for_tests.new.add_bunnies(0, "bugs bunny")).to include(nil => nil)
  end
  it "should match for count=0" do
    expect(Task_2_class_for_tests.new.add_bunnies(1, "bugs bunny eryery")).to include("bugs" => "bunny")
  end
end
