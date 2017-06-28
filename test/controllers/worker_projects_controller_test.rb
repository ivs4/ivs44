require 'test_helper'

class WorkerProjectsControllerTest < ActionController::TestCase
  setup do
    @worker_project = worker_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:worker_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worker_project" do
    assert_difference('WorkerProject.count') do
      post :create, worker_project: { project_id: @worker_project.project_id, worker_id: @worker_project.worker_id }
    end

    assert_redirected_to worker_project_path(assigns(:worker_project))
  end

  test "should show worker_project" do
    get :show, id: @worker_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @worker_project
    assert_response :success
  end

  test "should update worker_project" do
    patch :update, id: @worker_project, worker_project: { project_id: @worker_project.project_id, worker_id: @worker_project.worker_id }
    assert_redirected_to worker_project_path(assigns(:worker_project))
  end

  test "should destroy worker_project" do
    assert_difference('WorkerProject.count', -1) do
      delete :destroy, id: @worker_project
    end

    assert_redirected_to worker_projects_path
  end
end
