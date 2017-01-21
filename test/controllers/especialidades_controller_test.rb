require 'test_helper'

class EspecialidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @especialidade = especialidades(:one)
  end

  test "should get index" do
    get especialidades_index_url, as: :json
    assert_response :success
  end

  test "should create especialidade" do
    assert_difference('Especialidades.count') do
      post especialidades_index_url, params: { especialidade: { estatus: @especialidade.estatus, nombre: @especialidade.nombre } }, as: :json
    end

    assert_response 201
  end

  test "should show especialidade" do
    get especialidade_url(@especialidade), as: :json
    assert_response :success
  end

  test "should update especialidade" do
    patch especialidade_url(@especialidade), params: { especialidade: { estatus: @especialidade.estatus, nombre: @especialidade.nombre } }, as: :json
    assert_response 200
  end

  test "should destroy especialidade" do
    assert_difference('Especialidades.count', -1) do
      delete especialidade_url(@especialidade), as: :json
    end

    assert_response 204
  end
end
