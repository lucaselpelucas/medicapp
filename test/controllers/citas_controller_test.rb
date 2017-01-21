require 'test_helper'

class CitasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cita = citas(:one)
  end

  test "should get index" do
    get citas_index_url, as: :json
    assert_response :success
  end

  test "should create cita" do
    assert_difference('Citas.count') do
      post citas_index_url, params: { cita: { estatus: @cita.estatus, fecha: @cita.fecha, folio: @cita.folio, hora: @cita.hora, pacientes_id_id: @cita.pacientes_id_id, telefono: @cita.telefono, tipo_cita: @cita.tipo_cita } }, as: :json
    end

    assert_response 201
  end

  test "should show cita" do
    get cita_url(@cita), as: :json
    assert_response :success
  end

  test "should update cita" do
    patch cita_url(@cita), params: { cita: { estatus: @cita.estatus, fecha: @cita.fecha, folio: @cita.folio, hora: @cita.hora, pacientes_id_id: @cita.pacientes_id_id, telefono: @cita.telefono, tipo_cita: @cita.tipo_cita } }, as: :json
    assert_response 200
  end

  test "should destroy cita" do
    assert_difference('Citas.count', -1) do
      delete cita_url(@cita), as: :json
    end

    assert_response 204
  end
end
