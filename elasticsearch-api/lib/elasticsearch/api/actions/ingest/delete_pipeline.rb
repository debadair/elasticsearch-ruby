# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
    module API
  module Ingest
      module Actions

        # Deletes a pipeline.

        #
        # @option arguments [String] :id Pipeline ID

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/delete-pipeline-api.html
        #
        def delete_pipeline(arguments={})
          raise ArgumentError, "Required argument 'id' missing" unless arguments[:id]
          arguments = arguments.clone

          _id = arguments.delete(:id)


          method = HTTP_DELETE
          path   = Utils.__pathify "_ingest/pipeline/#{_id}", Utils.__listify(_id)
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
          body   = nil

          perform_request(method, path, params, body).body
        end


        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:delete_pipeline, [
          :master_timeout,
          :timeout
        ].freeze)

end
    end
  end
end
