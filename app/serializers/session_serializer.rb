class SessionSerializer < ActiveModel::Serializer
    attributes :id, :folio, :token
end