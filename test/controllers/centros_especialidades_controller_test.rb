require 'test_helper'

class CentrosEspecialidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @centros_especialidade = centros_especialidades(:one)
  end

  test "should get index" do
    get centros_especialidades_index_url, as: :json
    assert_response :success
  end

  test "should create centros_especialidade" do
    assert_difference('CentrosEspecialidades.count') do
      post centros_especialidades_index_url, params: { centros_especialidade: { centros_medicos_id_id: @centros_especialidade.centros_medicos_id_id, especialidades_id_id: @centros_especialidade.especialidades_id_id } }, as: :json
    end

    assert_response 201
  end

  test "should show centros_especialidade" do
    get centros_especialidade_url(@centros_especialidade), as: :json
    assert_response :success
  end

  test "should update centros_especialidade" do
    patch centros_especialidade_url(@centros_especialidade), params: { centros_especialidade: { centros_medicos_id_id: @centros_especialidade.centros_medicos_id_id, especialidades_id_id: @centros_especialidade.especialidades_id_id } }, as: :json
    assert_response 200
  end

  test "should destroy centros_especialidade" do
    assert_difference('CentrosEspecialidades.count', -1) do
      delete centros_especialidade_url(@centros_especialidade), as: :json
    end

    assert_response 204
  end
end
