#
# Author:: Doug MacEachern (<dougm@vmware.com>)
# Author:: Tyler Cloke (<tyler@chef.io>)
# Copyright:: Copyright 2010-2016, VMware, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class Chef
  class Resource
    class Env < Chef::Resource

      identity_attr :key_name

      state_attrs :value

      provides :env, os: "windows"

      default_action :create
      allowed_actions :create, :delete, :modify

      def initialize(name, run_context = nil)
        super
        @key_name = name
        @value = nil
        @delim = nil
      end

      def key_name(arg = nil)
        set_or_return(
          :key_name,
          arg,
          :kind_of => [ String ]
        )
      end

      def value(arg = nil)
        set_or_return(
          :value,
          arg,
          :kind_of => [ String ]
        )
      end

      def delim(arg = nil)
        set_or_return(
          :delim,
          arg,
          :kind_of => [ String ]
        )
      end
    end
  end
end
