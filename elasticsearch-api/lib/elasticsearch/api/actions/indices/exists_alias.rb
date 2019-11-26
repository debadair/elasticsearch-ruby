# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
    module API
  module Indices
      module Actions

        # Returns information about whether a particular alias exists.

        #
        # @option arguments [List] :name A comma-separated list of alias names to return

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-aliases.html
        #
        def exists_alias(arguments={})
          raise ArgumentError, "Required argument 'name' missing" unless arguments[:name]
          arguments = arguments.clone

          _name = arguments.delete(:name)


          method = HTTP_HEAD
          path   = Utils.__pathify "_alias/#{_name}", Utils.__listify(_name)
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
          body   = nil

          perform_request(method, path, params, body).body
        end


        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:exists_alias, [
          :ignore_unavailable,
          :allow_no_indices,
          :expand_wildcards,
          :local
        ].freeze)

end
    end
  end
end
