require "minitest/autorun"
require "minitest/pride"
require_relative "task"
require_relative "task_list"

class TaskListTest < Minitest::Test
  def test_example
    assert TaskList.new
    assert Task.new("my task")
  end

  def test_task_creation
    task = Task.new('Do the laundry')
    assert_equal 'Do the laundry', task.name
    assert_equal false, task.completed
  end

  def test_task_complete
    task = Task.new('foo')
    task.complete!
    assert_equal true, task.completed
  end

  def test_task_uncomplete
    task = Task.new('foo')

    task.complete!
    assert_equal true, task.completed

    task.uncomplete!
    assert_equal false, task.completed
  end

  def test_task_list_add
    task_list = TaskList.new()
    foo_task = Task.new('foo')
    bar_task = Task.new('bar')
    task_list.add_task(foo_task)
    task_list.add_task(bar_task)

    assert_equal [foo_task, bar_task], task_list.all_tasks
  end

  def test_task_list_remove
    task_list = TaskList.new()
    foo_task = Task.new('foo')
    bar_task = Task.new('bar')
    task_list.add_task(foo_task)
    task_list.add_task(bar_task)

    assert_equal [foo_task, bar_task], task_list.all_tasks

    task_list.remove_task('bar')

    assert_equal [foo_task], task_list.all_tasks
  end

  def test_task_list_completed_tasks
    task_list = TaskList.new()
    foo_task = Task.new('foo')
    foo_task.complete!
    bar_task = Task.new('bar')
    task_list.add_task(foo_task)
    task_list.add_task(bar_task)
    
    assert_equal [foo_task], task_list.completed_tasks
  end

  def test_task_list_incomplete_tasks
    task_list = TaskList.new()
    foo_task = Task.new('foo')
    foo_task.complete!
    bar_task = Task.new('bar')
    task_list.add_task(foo_task)
    task_list.add_task(bar_task)

    assert_equal [bar_task], task_list.incomplete_tasks
  end

  def test_task_list_removes_all_tasks_with_same_name
    task_list = TaskList.new()
    bar_task = Task.new('bar')
    task_list.add_task(Task.new('foo'))
    task_list.add_task(Task.new('foo'))
    task_list.add_task(Task.new('foo'))
    task_list.add_task(bar_task)

    task_list.remove_task('foo')

    assert_equal [bar_task], task_list.all_tasks
  end
end
