# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
    module API
  module Ingest
      module Actions

        # Allows to simulate a pipeline with example documents.

        #
        # @option arguments [String] :id Pipeline ID
        # @option arguments [Hash] :body The simulate definition (*Required*)

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/simulate-pipeline-api.html
        #
        def simulate(arguments={})
          raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
          raise ArgumentError, "Required argument 'id' missing" unless arguments[:id]
          arguments = arguments.clone

          _id = arguments.delete(:id)


          method = HTTP_GET
          path   = Utils.__pathify "_ingest/pipeline/_simulate", Utils.__listify(_id)
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
          body   = arguments[:body]

          perform_request(method, path, params, body).body
        end


        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:simulate, [
          :verbose
        ].freeze)

end
    end
  end
end
