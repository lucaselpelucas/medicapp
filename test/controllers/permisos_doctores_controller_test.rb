require 'test_helper'

class PermisosDoctoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @permisos_doctore = permisos_doctores(:one)
  end

  test "should get index" do
    get permisos_doctores_index_url, as: :json
    assert_response :success
  end

  test "should create permisos_doctore" do
    assert_difference('PermisosDoctores.count') do
      post permisos_doctores_index_url, params: { permisos_doctore: { doctores_id_id: @permisos_doctore.doctores_id_id, inicio_baja: @permisos_doctore.inicio_baja, termino_baja: @permisos_doctore.termino_baja } }, as: :json
    end

    assert_response 201
  end

  test "should show permisos_doctore" do
    get permisos_doctore_url(@permisos_doctore), as: :json
    assert_response :success
  end

  test "should update permisos_doctore" do
    patch permisos_doctore_url(@permisos_doctore), params: { permisos_doctore: { doctores_id_id: @permisos_doctore.doctores_id_id, inicio_baja: @permisos_doctore.inicio_baja, termino_baja: @permisos_doctore.termino_baja } }, as: :json
    assert_response 200
  end

  test "should destroy permisos_doctore" do
    assert_difference('PermisosDoctores.count', -1) do
      delete permisos_doctore_url(@permisos_doctore), as: :json
    end

    assert_response 204
  end
end
