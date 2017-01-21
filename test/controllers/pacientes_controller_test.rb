require 'test_helper'

class PacientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paciente = pacientes(:one)
  end

  test "should get index" do
    get pacientes_index_url, as: :json
    assert_response :success
  end

  test "should create paciente" do
    assert_difference('Pacientes.count') do
      post pacientes_index_url, params: { paciente: { centros_id_id: @paciente.centros_id_id, ciudad: @paciente.ciudad, colonia: @paciente.colonia, cp: @paciente.cp, curp: @paciente.curp, domicilio: @paciente.domicilio, estado: @paciente.estado, fecha_nacimiento: @paciente.fecha_nacimiento, folio: @paciente.folio, nombre: @paciente.nombre, parentesco: @paciente.parentesco, poliza: @paciente.poliza, reafiliacion: @paciente.reafiliacion, regimen: @paciente.regimen, sexo: @paciente.sexo, validez_inicio: @paciente.validez_inicio, validez_termino: @paciente.validez_termino } }, as: :json
    end

    assert_response 201
  end

  test "should show paciente" do
    get paciente_url(@paciente), as: :json
    assert_response :success
  end

  test "should update paciente" do
    patch paciente_url(@paciente), params: { paciente: { centros_id_id: @paciente.centros_id_id, ciudad: @paciente.ciudad, colonia: @paciente.colonia, cp: @paciente.cp, curp: @paciente.curp, domicilio: @paciente.domicilio, estado: @paciente.estado, fecha_nacimiento: @paciente.fecha_nacimiento, folio: @paciente.folio, nombre: @paciente.nombre, parentesco: @paciente.parentesco, poliza: @paciente.poliza, reafiliacion: @paciente.reafiliacion, regimen: @paciente.regimen, sexo: @paciente.sexo, validez_inicio: @paciente.validez_inicio, validez_termino: @paciente.validez_termino } }, as: :json
    assert_response 200
  end

  test "should destroy paciente" do
    assert_difference('Pacientes.count', -1) do
      delete paciente_url(@paciente), as: :json
    end

    assert_response 204
  end
end
