# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
    module API
  module Snapshot
      module Actions

        # Verifies a repository.

        #
        # @option arguments [String] :repository A repository name

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/modules-snapshots.html
        #
        def verify_repository(arguments={})
          raise ArgumentError, "Required argument 'repository' missing" unless arguments[:repository]
          arguments = arguments.clone

          _repository = arguments.delete(:repository)


          method = HTTP_POST
          path   = Utils.__pathify "_snapshot/#{_repository}/_verify", Utils.__listify(_repository)
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
          body   = nil

          perform_request(method, path, params, body).body
        end


        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:verify_repository, [
          :master_timeout,
          :timeout
        ].freeze)

end
    end
  end
end
