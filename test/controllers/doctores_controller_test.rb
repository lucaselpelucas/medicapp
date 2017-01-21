require 'test_helper'

class DoctoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctore = doctores(:one)
  end

  test "should get index" do
    get doctores_index_url, as: :json
    assert_response :success
  end

  test "should create doctore" do
    assert_difference('Doctores.count') do
      post doctores_index_url, params: { doctore: { cedulaespecial: @doctore.cedulaespecial, cedulageneral: @doctore.cedulageneral, centros_id_id: @doctore.centros_id_id, citasdia: @doctore.citasdia, entrada: @doctore.entrada, especialidades_id_id: @doctore.especialidades_id_id, nombre: @doctore.nombre, rssp: @doctore.rssp, salida: @doctore.salida, universidad: @doctore.universidad } }, as: :json
    end

    assert_response 201
  end

  test "should show doctore" do
    get doctore_url(@doctore), as: :json
    assert_response :success
  end

  test "should update doctore" do
    patch doctore_url(@doctore), params: { doctore: { cedulaespecial: @doctore.cedulaespecial, cedulageneral: @doctore.cedulageneral, centros_id_id: @doctore.centros_id_id, citasdia: @doctore.citasdia, entrada: @doctore.entrada, especialidades_id_id: @doctore.especialidades_id_id, nombre: @doctore.nombre, rssp: @doctore.rssp, salida: @doctore.salida, universidad: @doctore.universidad } }, as: :json
    assert_response 200
  end

  test "should destroy doctore" do
    assert_difference('Doctores.count', -1) do
      delete doctore_url(@doctore), as: :json
    end

    assert_response 204
  end
end
