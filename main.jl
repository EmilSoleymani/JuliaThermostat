using Test
using QML
using Qt5QuickControls_jll
using Qt5QuickControls2_jll
using Observables

@enum HeatSelectState Heating Cooling Auto
@enum Units Farenheit Celsius

# Conversion functions
farToCels(t) = (t-32)*(5/9)
celsToFar(t) = (t*(9/5))+32

# State variables
currentSystemTemp = Observable(65)
targetTemp = Observable(70)
systemStatusMessage = Observable("Heating...")
systemState = Observable(Int(Heating))
systemUnits = Observable(Int(Farenheit))

# Update targetTemp Observable. Update Sysem status message
function setTargetTemp(temp)
    global targetTemp[] = temp
    checkSystemStatus()
end

# Update systemState Observable. Update Sysem status message
function setSystemState(state) 
    systemState[] = state
    checkSystemStatus()
end

# Update unit system
function setSystemUnits()
    units = (systemUnits[] == 0) ? 1 : 0
    systemUnits[] = units
    # Convert units
    if units == Int(Farenheit)
        currentSystemTemp[] = round(celsToFar(currentSystemTemp[]))
        targetTemp[] = round(celsToFar(targetTemp[]))
    elseif units == Int(Celsius)
        currentSystemTemp[] = round(farToCels(currentSystemTemp[]))
        targetTemp[] = round(farToCels(targetTemp[]))
    end
end

# Checks system status and updates systemStatusMessage
function checkSystemStatus()
    if currentSystemTemp[] < targetTemp[] && systemState[] == Int(Heating)
        systemStatusMessage[] = "Heating..."
    elseif currentSystemTemp[] > targetTemp[] && systemState[] == Int(Cooling)
        systemStatusMessage[] = "Cooling..."
    elseif systemState[] == Int(Auto)
        if currentSystemTemp[] < targetTemp[]
            systemStatusMessage[] = "Heating..."
        elseif currentSystemTemp[] > targetTemp[]
            systemStatusMessage[] = "Cooling..."
        else
            systemStatusMessage[] = "Holding..."
        end
    else 
        systemStatusMessage[] = "Holding..."
    end
end

@qmlfunction setTargetTemp setSystemState setSystemUnits farToCels celsToFar round

# Load QML File
loadqml("main.qml", 
        guiproperties=JuliaPropertyMap("currentSystemTemperature" => currentSystemTemp, "targetTemp" => targetTemp, "systemState" => systemState, "systemStatusMessage" => systemStatusMessage, "systemUnits" => systemUnits))

# Run the application
exec()
