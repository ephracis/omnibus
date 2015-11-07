#
# Copyright 2012-2014 Chef Software, Inc.
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

module Omnibus
  module Licenses
    extend self

    def notice_list(project)
      out = ''

      out
    end

    def license_list(project)
      licenses = project.library.license_map
      out = ''
      out << "\n\n"

      licenses.keys.sort.each do |name|
        license = licenses[name][:license]
        license_location = licenses[name][:license_location]
        version = licenses[name][:version]

        if version
          out << "This product bundles #{name} #{version},\n"
          out << "which is available under a \"#{license}\" License.\n"
          if license_location
            out << "For details, see #{license_location}\n"
          end
          out << "\n"
        end
      end

      out
    end

  end
end
