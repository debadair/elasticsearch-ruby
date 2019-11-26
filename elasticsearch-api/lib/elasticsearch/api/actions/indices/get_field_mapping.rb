# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
    module API
  module Indices
      module Actions

        # Returns mapping for one or more fields.

        #
        # @option arguments [List] :fields A comma-separated list of fields

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-get-field-mapping.html
        #
        def get_field_mapping(arguments={})
          raise ArgumentError, "Required argument 'fields' missing" unless arguments[:fields]
          arguments = arguments.clone

          _fields = arguments.delete(:fields)


          method = HTTP_GET
          path   = Utils.__pathify "_mapping/field/#{_fields}", Utils.__listify(_fields)
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
          body   = nil

          perform_request(method, path, params, body).body
        end


        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:get_field_mapping, [
          :include_type_name,
          :include_defaults,
          :ignore_unavailable,
          :allow_no_indices,
          :expand_wildcards,
          :local
        ].freeze)

end
    end
  end
end
