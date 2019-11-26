# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
    module API
  module Snapshot
      module Actions

        # Returns information about a repository.

        #
        # @option arguments [List] :repository A comma-separated list of repository names

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/modules-snapshots.html
        #
        def get_repository(arguments={})
          raise ArgumentError, "Required argument 'repository' missing" unless arguments[:repository]
          arguments = arguments.clone

          _repository = arguments.delete(:repository)


          method = HTTP_GET
          path   = Utils.__pathify "_snapshot", Utils.__listify(_repository)
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
          body   = nil

          perform_request(method, path, params, body).body
        end


        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:get_repository, [
          :master_timeout,
          :local
        ].freeze)

end
    end
  end
end
