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

require "kitchen/provisioner/terraform/call"

::RSpec.shared_examples "::Kitchen::Provisioner::Terraform::Call" do
  subject do
    lambda do
      described_method.call instance_double ::Object
    end
  end

  context "when the action is a failure" do
    before do
      allow(described_instance.client).to receive(:apply_constructively).with(no_args).and_throw :failure, "failure"
    end

    it "raises an action failed error" do
      is_expected.to raise_error ::Kitchen::ActionFailed, "failure"
    end
  end

  context "when the action is a success" do
    before do
      allow(described_instance.client).to receive(:apply_constructively).with(no_args).and_throw :success, "success"
    end

    it "applies constructively" do
      is_expected.to_not raise_error
    end
  end
end
