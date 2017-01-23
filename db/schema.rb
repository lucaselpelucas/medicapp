# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170121215342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrativos", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "nip"
    t.integer  "permiso"
    t.string   "usuario"
    t.integer  "centros_medicos_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["centros_medicos_id"], name: "index_administrativos_on_centros_medicos_id", using: :btree
  end

  create_table "centros_especialidades", force: :cascade do |t|
    t.integer  "centros_medicos_id"
    t.integer  "especialidades_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["centros_medicos_id"], name: "index_centros_especialidades_on_centros_medicos_id", using: :btree
    t.index ["especialidades_id"], name: "index_centros_especialidades_on_especialidades_id", using: :btree
  end

  create_table "centros_medicos", force: :cascade do |t|
    t.string   "unidadmedica"
    t.string   "direccion"
    t.string   "colonia"
    t.string   "telefono"
    t.string   "general"
    t.string   "dental"
    t.string   "consultoriorosa"
    t.string   "epidemiologia"
    t.string   "pediatria"
    t.time     "hr_inicio"
    t.time     "hr_cierre"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "citas", force: :cascade do |t|
    t.integer  "pacientes_id"
    t.string   "folio"
    t.string   "tipo_cita"
    t.date     "fecha"
    t.string   "telefono"
    t.time     "hora"
    t.integer  "estatus"
    t.integer  "cancelada"
    t.integer  "doctores_id"
    t.integer  "especialidades_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["doctores_id"], name: "index_citas_on_doctores_id", using: :btree
    t.index ["especialidades_id"], name: "index_citas_on_especialidades_id", using: :btree
    t.index ["pacientes_id"], name: "index_citas_on_pacientes_id", using: :btree
  end

  create_table "doctores", force: :cascade do |t|
    t.integer  "centros_medicos_id"
    t.string   "nombre"
    t.time     "entrada"
    t.time     "salida"
    t.string   "universidad"
    t.string   "rssp"
    t.string   "cedulageneral"
    t.string   "cedulaespecial"
    t.integer  "citasdia"
    t.integer  "especialidades_id"
    t.integer  "baja"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["centros_medicos_id"], name: "index_doctores_on_centros_medicos_id", using: :btree
    t.index ["especialidades_id"], name: "index_doctores_on_especialidades_id", using: :btree
  end

  create_table "doctores_horas", force: :cascade do |t|
    t.integer  "doctores_id"
    t.integer  "horas_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["doctores_id"], name: "index_doctores_horas_on_doctores_id", using: :btree
    t.index ["horas_id"], name: "index_doctores_horas_on_horas_id", using: :btree
  end

  create_table "especialidades", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "estatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "horas", force: :cascade do |t|
    t.time     "hora"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pacientes", force: :cascade do |t|
    t.integer  "centros_medicos_id"
    t.string   "poliza"
    t.string   "folio"
    t.string   "nombre"
    t.string   "sexo"
    t.date     "fecha_nacimiento"
    t.string   "curp"
    t.string   "parentesco"
    t.string   "regimen"
    t.text     "domicilio"
    t.string   "colonia"
    t.integer  "cp"
    t.string   "ciudad"
    t.string   "estado"
    t.date     "validez_inicio"
    t.date     "validez_termino"
    t.date     "reafiliacion"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["centros_medicos_id"], name: "index_pacientes_on_centros_medicos_id", using: :btree
  end

  create_table "permisos_doctores", force: :cascade do |t|
    t.integer  "doctores_id"
    t.date     "inicio_baja"
    t.date     "termino_baja"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["doctores_id"], name: "index_permisos_doctores_on_doctores_id", using: :btree
  end

  add_foreign_key "administrativos", "centros_medicos", column: "centros_medicos_id"
  add_foreign_key "centros_especialidades", "centros_medicos", column: "centros_medicos_id"
  add_foreign_key "centros_especialidades", "especialidades", column: "especialidades_id"
  add_foreign_key "citas", "doctores", column: "doctores_id"
  add_foreign_key "citas", "especialidades", column: "especialidades_id"
  add_foreign_key "citas", "pacientes", column: "pacientes_id"
  add_foreign_key "doctores", "centros_medicos", column: "centros_medicos_id"
  add_foreign_key "doctores", "especialidades", column: "especialidades_id"
  add_foreign_key "doctores_horas", "doctores", column: "doctores_id"
  add_foreign_key "doctores_horas", "horas", column: "horas_id"
  add_foreign_key "pacientes", "centros_medicos", column: "centros_medicos_id"
  add_foreign_key "permisos_doctores", "doctores", column: "doctores_id"
end
