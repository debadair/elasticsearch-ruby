# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
    module API
  module Snapshot
      module Actions

        # Deletes a snapshot.

        #
        # @option arguments [String] :repository A repository name
        # @option arguments [String] :snapshot A snapshot name

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/modules-snapshots.html
        #
        def delete(arguments={})
          raise ArgumentError, "Required argument 'repository' missing" unless arguments[:repository]
          raise ArgumentError, "Required argument 'snapshot' missing" unless arguments[:snapshot]
          arguments = arguments.clone

          _repository = arguments.delete(:repository)

          _snapshot = arguments.delete(:snapshot)


          method = HTTP_DELETE
          path   = Utils.__pathify "_snapshot/#{_repository}/#{_snapshot}", Utils.__listify(_repository), Utils.__listify(_snapshot)
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
          body   = nil

          perform_request(method, path, params, body).body
        end


        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:delete, [
          :master_timeout
        ].freeze)

end
    end
  end
end
