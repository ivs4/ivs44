require 'test_helper'

class WorkersControllerTest < ActionController::TestCase
  setup do
    @worker = workers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worker" do
    assert_difference('Worker.count') do
      post :create, worker: { birthday: @worker.birthday, department_id: @worker.department_id, fn: @worker.fn, inn: @worker.inn, ln: @worker.ln, pas_number: @worker.pas_number, pas_serial: @worker.pas_serial, post: @worker.post, sn: @worker.sn }
    end

    assert_redirected_to worker_path(assigns(:worker))
  end

  test "should show worker" do
    get :show, id: @worker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @worker
    assert_response :success
  end

  test "should update worker" do
    patch :update, id: @worker, worker: { birthday: @worker.birthday, department_id: @worker.department_id, fn: @worker.fn, inn: @worker.inn, ln: @worker.ln, pas_number: @worker.pas_number, pas_serial: @worker.pas_serial, post: @worker.post, sn: @worker.sn }
    assert_redirected_to worker_path(assigns(:worker))
  end

  test "should destroy worker" do
    assert_difference('Worker.count', -1) do
      delete :destroy, id: @worker
    end

    assert_redirected_to workers_path
  end
end
