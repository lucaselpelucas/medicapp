require 'test_helper'

class CentrosMedicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @centros_medico = centros_medicos(:one)
  end

  test "should get index" do
    get centros_medicos_index_url, as: :json
    assert_response :success
  end

  test "should create centros_medico" do
    assert_difference('CentrosMedicos.count') do
      post centros_medicos_index_url, params: { centros_medico: { colonia: @centros_medico.colonia, consultoriorosa: @centros_medico.consultoriorosa, dental: @centros_medico.dental, direccion: @centros_medico.direccion, epidemiologia: @centros_medico.epidemiologia, general: @centros_medico.general, hr_cierre: @centros_medico.hr_cierre, hr_inicio: @centros_medico.hr_inicio, pediatria: @centros_medico.pediatria, telefono: @centros_medico.telefono, unidadmedica: @centros_medico.unidadmedica } }, as: :json
    end

    assert_response 201
  end

  test "should show centros_medico" do
    get centros_medico_url(@centros_medico), as: :json
    assert_response :success
  end

  test "should update centros_medico" do
    patch centros_medico_url(@centros_medico), params: { centros_medico: { colonia: @centros_medico.colonia, consultoriorosa: @centros_medico.consultoriorosa, dental: @centros_medico.dental, direccion: @centros_medico.direccion, epidemiologia: @centros_medico.epidemiologia, general: @centros_medico.general, hr_cierre: @centros_medico.hr_cierre, hr_inicio: @centros_medico.hr_inicio, pediatria: @centros_medico.pediatria, telefono: @centros_medico.telefono, unidadmedica: @centros_medico.unidadmedica } }, as: :json
    assert_response 200
  end

  test "should destroy centros_medico" do
    assert_difference('CentrosMedicos.count', -1) do
      delete centros_medico_url(@centros_medico), as: :json
    end

    assert_response 204
  end
end
