-- Copyright 2015 Stanford University, NVIDIA Corporation
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

-- fails-with:
-- ...e/stanford/projects/legion/language/src/bishop/codegen.t:554: parameter 'r' either does not exist or have a non-region type
-- region_name_invalid2.rg:26: 
-- task#foo region#r {
--                ^

import "regent"
import "bishop"

mapper

task#foo region#r {
  target : memories[kind=sysmem];
}

end

task foo(r : int)
end

task toplevel()
  foo(1)
end

bishoplib.register_bishop_mappers()
regentlib.start(toplevel)