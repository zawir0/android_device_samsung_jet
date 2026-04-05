# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# Input Device Calibration File for the Spica touch screen.
#
# These calibration values are derived from empirical measurements
# and may not be appropriate for use with other touch screens.
# Refer to the input device calibration documentation for more details.
#

# Basic Parameters (Crucial for ICS!)
touch.deviceType = touchScreen
touch.orientationAware = 1

# Touch Size
touch.touchSize.calibration = pressure

# Tool Size
# Based on empirical measurements for Spica/Jet
touch.toolSize.calibration = area
touch.toolSize.areaScale = 22
touch.toolSize.areaBias = 0
touch.toolSize.linearScale = 9.2
touch.toolSize.linearBias = 0
touch.toolSize.isSummed = 1

# Pressure
touch.pressure.calibration = amplitude
touch.pressure.source = pressure
touch.pressure.scale = 0.025

# Size (Fixed for ICS parser)
touch.size.calibration = diameter

# Orientation
touch.orientation.calibration = none
