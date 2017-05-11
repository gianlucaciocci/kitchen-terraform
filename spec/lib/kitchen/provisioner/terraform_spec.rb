# frozen_string_literal: true

# Copyright 2016 New Context Services, Inc.
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

require "kitchen/provisioner/terraform"
require "support/kitchen/provisioner/terraform/call_examples"
require "support/terraform/configurable_context"
require "support/terraform/configurable_examples"

::RSpec.describe ::Kitchen::Provisioner::Terraform do
  include_context "instance"

  let :described_instance do provisioner end

  it_behaves_like ::Terraform::Configurable

  describe "#call" do
    include_context "client"

    it_behaves_like "::Kitchen::Provisioner::Terraform::Call" do
      let :described_method do
        described_instance.method :call
      end
    end
  end
end
